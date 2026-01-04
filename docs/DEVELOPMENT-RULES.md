# Development Rules

Core principles and standards for MERIDIEN development.

## Table of Contents
1. [Core Principles](#core-principles)
2. [Backend (Go)](#backend-go)
3. [Frontend (Flutter)](#frontend-flutter)
4. [Database](#database)
5. [API Design](#api-design)
6. [Security](#security)

---

## Core Principles

### Non-Negotiable

1. **Security First**
   - Never store sensitive data in plain text
   - Never trust user input
   - Never skip authentication/authorization
   - Never commit secrets

2. **Multi-Tenancy**
   - Every query MUST filter by `tenant_id`
   - Every endpoint MUST validate tenant context
   - Never allow cross-tenant access

3. **Data Integrity**
   - Use foreign keys with proper cascading
   - Use transactions for multi-step operations
   - Never hard delete (use soft deletes)
   - Always validate input

4. **Simplicity**
   - Write for humans, not compilers
   - Prefer boring solutions over trendy ones
   - YAGNI - build what's needed now

5. **Fail Fast**
   - Return errors, don't swallow them
   - Log errors with context
   - Validate early and often

---

## Backend (Go)

### Structure

```
internal/
├── config/          # Configuration
├── handlers/        # HTTP layer
├── services/        # Business logic
├── repositories/    # Data access
├── models/          # GORM entities
├── dto/             # Request/response objects
├── middleware/      # HTTP middleware
└── utils/           # Utilities
```

### Naming Conventions

**Files:** `snake_case.go`
```
✅ customer_service.go
✅ order_repository.go
❌ CustomerService.go
❌ orderRepo.go
```

**Functions/Methods:**
```go
✅ func GetCustomerByID(id uint)      // Exported: PascalCase
✅ func validateEmail(email string)   // Unexported: camelCase
❌ func getcustomerbyid(id uint)
❌ func Get_Customer(id uint)
```

**Types:**
```go
✅ type Customer struct {}           // Exported
✅ type OrderService interface {}
❌ type customer struct {}           // Should be exported
❌ type orderservice interface {}
```

**Variables:**
```go
✅ var customerName string           // camelCase
✅ const MaxPageSize = 100           // PascalCase for exported
❌ var CustomerName string
❌ var customer_name string
```

### Clean Architecture Pattern

```go
// 1. Model (internal/models/customer.go)
type Customer struct {
    ID        uint           `gorm:"primaryKey"`
    TenantID  uint           `gorm:"not null;index"`
    Name      string         `gorm:"type:varchar(255);not null"`
    Email     string         `gorm:"type:varchar(255)"`
    CreatedAt time.Time
    UpdatedAt time.Time
    DeletedAt gorm.DeletedAt `gorm:"index"`
}

// 2. Repository Interface (internal/repositories/customer_repository.go)
type CustomerRepository interface {
    Create(ctx context.Context, customer *models.Customer) error
    GetByID(ctx context.Context, tenantID, id uint) (*models.Customer, error)
    Update(ctx context.Context, customer *models.Customer) error
    Delete(ctx context.Context, tenantID, id uint) error
}

// 3. Service (internal/services/customer_service.go)
type CustomerService interface {
    CreateCustomer(ctx context.Context, tenantID uint, req *dto.CreateCustomerRequest) (*dto.CustomerResponse, error)
}

type customerService struct {
    repo repositories.CustomerRepository
}

func (s *customerService) CreateCustomer(ctx context.Context, tenantID uint, req *dto.CreateCustomerRequest) (*dto.CustomerResponse, error) {
    // Business logic here
    customer := &models.Customer{
        TenantID: tenantID,
        Name:     req.Name,
        Email:    req.Email,
    }
    
    if err := s.repo.Create(ctx, customer); err != nil {
        return nil, err
    }
    
    return mapToResponse(customer), nil
}

// 4. Handler (internal/handlers/customer_handler.go)
type CustomerHandler struct {
    service services.CustomerService
}

func (h *CustomerHandler) Create(c *gin.Context) {
    tenantID := utils.GetTenantID(c)
    
    var req dto.CreateCustomerRequest
    if err := c.ShouldBindJSON(&req); err != nil {
        utils.ErrorResponse(c, http.StatusBadRequest, "Invalid request", err)
        return
    }
    
    customer, err := h.service.CreateCustomer(c.Request.Context(), tenantID, &req)
    if err != nil {
        utils.ErrorResponse(c, http.StatusUnprocessableEntity, "Failed to create", err)
        return
    }
    
    utils.SuccessResponse(c, http.StatusCreated, "Created successfully", customer)
}
```

### Rules

**Models:**
- ✅ Include: `ID`, `TenantID`, `CreatedAt`, `UpdatedAt`, `DeletedAt`
- ✅ Use `gorm` and `json` tags
- ❌ Never put business logic in models

**Repositories:**
- ✅ Define interface
- ✅ Always use `context.Context`
- ✅ Always filter by `tenant_id`
- ❌ Never put business logic here

**Services:**
- ✅ Implement business logic
- ✅ Validate business rules
- ✅ Orchestrate repositories
- ✅ Map between DTOs and models
- ❌ Never access database directly

**Handlers:**
- ✅ Handle HTTP concerns only
- ✅ Get tenant_id from middleware
- ✅ Validate input
- ✅ Return consistent responses
- ❌ Never put business logic here

### Error Handling

```go
// Define common errors
var (
    ErrNotFound       = errors.New("not found")
    ErrUnauthorized   = errors.New("unauthorized")
    ErrInvalidInput   = errors.New("invalid input")
)

// Wrap with context
return fmt.Errorf("failed to create customer: %w", err)

// Check errors
if errors.Is(err, ErrNotFound) {
    // Handle not found
}
```

### Logging

```go
// ✅ Structured logging with context
log.WithFields(log.Fields{
    "tenant_id": tenantID,
    "user_id":   userID,
    "action":    "create_customer",
}).Info("Customer created")

// ❌ Don't use println
fmt.Println("Error:", err)  // WRONG
```

---

## Frontend (Flutter)

### Structure

```
lib/
├── core/              # Config, themes, utils
├── shared/            # Shared models, widgets
├── features/          # Feature modules
│   ├── auth/
│   ├── customers/
│   └── products/
└── routes/            # Navigation
```

### Naming Conventions

**Files:** `snake_case.dart`
```
✅ customer_list_page.dart
✅ customer_card.dart
❌ CustomerListPage.dart
❌ customerCard.dart
```

**Classes:** `PascalCase`
```dart
✅ class CustomerListPage extends StatelessWidget {}
✅ class CustomerCard extends StatelessWidget {}
❌ class customerListPage {}
```

**Variables/Functions:** `camelCase`
```dart
✅ String customerName;
✅ void createCustomer() {}
❌ String CustomerName;
❌ void CreateCustomer() {}
```

### Patterns

```dart
// 1. Model (Freezed)
@freezed
class Customer with _$Customer {
  const factory Customer({
    required int id,
    required String name,
    String? email,
    required DateTime createdAt,
  }) = _Customer;

  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);
}

// 2. Service (API)
class CustomerService {
  final ApiClient _client;

  Future<List<Customer>> getCustomers() async {
    final response = await _client.get('/customers');
    return (response.data['data'] as List)
        .map((json) => Customer.fromJson(json))
        .toList();
  }
}

// 3. Provider (Riverpod)
@freezed
class CustomerListState with _$CustomerListState {
  const factory CustomerListState({
    @Default([]) List<Customer> customers,
    @Default(false) bool isLoading,
    String? error,
  }) = _CustomerListState;
}

class CustomerListController extends StateNotifier<CustomerListState> {
  final CustomerService _service;

  CustomerListController(this._service) : super(const CustomerListState());

  Future<void> loadCustomers() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final customers = await _service.getCustomers();
      state = state.copyWith(customers: customers, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}

// 4. Page
class CustomerListPage extends ConsumerStatefulWidget {
  @override
  ConsumerState<CustomerListPage> createState() => _CustomerListPageState();
}

class _CustomerListPageState extends ConsumerState<CustomerListPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
      ref.read(customerListControllerProvider.notifier).loadCustomers()
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(customerListControllerProvider);
    
    if (state.isLoading) return const CircularProgressIndicator();
    if (state.error != null) return Text('Error: ${state.error}');
    
    return ListView.builder(
      itemCount: state.customers.length,
      itemBuilder: (context, index) => CustomerCard(customer: state.customers[index]),
    );
  }
}
```

### Rules

**Models:**
- ✅ Use Freezed for immutability
- ✅ Use `required` for non-nullable
- ✅ Generate JSON serialization
- ❌ Never make models mutable

**Services:**
- ✅ Handle API calls only
- ✅ Convert JSON to models
- ❌ Never handle UI state

**Providers:**
- ✅ Use StateNotifier for state
- ✅ Handle loading/error states
- ❌ Never access BuildContext

**Pages:**
- ✅ Use ConsumerWidget/ConsumerStatefulWidget
- ✅ Handle loading/error/empty states
- ❌ Never put business logic in pages

---

## Database

### Naming

**Tables:** `snake_case`, plural
```sql
✅ CREATE TABLE customers (...)
✅ CREATE TABLE order_items (...)
❌ CREATE TABLE Customer (...)
```

**Columns:** `snake_case`
```sql
✅ customer_name VARCHAR(255)
✅ created_at TIMESTAMP
❌ customerName VARCHAR(255)
```

### Required Fields

Every table must have:
```sql
CREATE TABLE example (
    id SERIAL PRIMARY KEY,              -- ✅ REQUIRED
    tenant_id INT REFERENCES tenants(id), -- ✅ REQUIRED (except system tables)
    created_at TIMESTAMP DEFAULT NOW(), -- ✅ REQUIRED
    updated_at TIMESTAMP DEFAULT NOW(), -- ✅ REQUIRED
    deleted_at TIMESTAMP                -- ✅ REQUIRED (soft delete)
);
```

### Indexes

```sql
-- ✅ Always index foreign keys
CREATE INDEX idx_customers_tenant_id ON customers(tenant_id);

-- ✅ Index commonly queried fields
CREATE INDEX idx_orders_status ON orders(status);

-- ✅ Composite indexes for multi-column queries
CREATE INDEX idx_orders_tenant_date ON orders(tenant_id, order_date DESC);
```

### Foreign Keys

```sql
-- ✅ Always use foreign keys
customer_id INT REFERENCES customers(id) ON DELETE RESTRICT

-- ✅ CASCADE for dependent data
order_id INT REFERENCES orders(id) ON DELETE CASCADE

-- ✅ SET NULL for optional references
supplier_id INT REFERENCES suppliers(id) ON DELETE SET NULL
```

---

## API Design

### URL Structure

```
✅ GET    /api/v1/customers
✅ GET    /api/v1/customers/123
✅ POST   /api/v1/customers
✅ PUT    /api/v1/customers/123
✅ DELETE /api/v1/customers/123

❌ GET    /api/getCustomers
❌ POST   /api/customer/create
```

### HTTP Methods

- `GET` - Read (safe, idempotent)
- `POST` - Create (not idempotent)
- `PUT` - Update (idempotent)
- `DELETE` - Delete (idempotent)

### Status Codes

- `200 OK` - Successful GET, PUT
- `201 Created` - Successful POST
- `204 No Content` - Successful DELETE
- `400 Bad Request` - Invalid input
- `401 Unauthorized` - Not authenticated
- `403 Forbidden` - Not authorized
- `404 Not Found` - Resource not found
- `422 Unprocessable Entity` - Validation error
- `500 Internal Server Error` - Server error

### Response Format

**Success:**
```json
{
  "success": true,
  "message": "Operation completed",
  "data": {...}
}
```

**Error:**
```json
{
  "success": false,
  "error": "Error message",
  "message": "Detailed description"
}
```

**Pagination:**
```json
{
  "success": true,
  "data": [...],
  "meta": {
    "total": 100,
    "page": 1,
    "per_page": 20,
    "total_pages": 5
  }
}
```

---

## Security

### Authentication
- ✅ bcrypt for passwords (cost 10)
- ✅ JWT with 24h expiry
- ✅ Refresh tokens
- ✅ HTTPS in production
- ❌ Never log passwords or tokens

### Authorization
- ✅ Validate tenant_id on every request
- ✅ Check user permissions
- ✅ Use middleware for auth
- ❌ Never skip tenant validation

### Input Validation
- ✅ Validate at handler level
- ✅ Use binding tags in Go
- ✅ Sanitize user input
- ❌ Never trust user input

### SQL Injection
- ✅ Use GORM prepared statements
- ✅ Use parameterized queries
- ❌ Never concatenate SQL strings

---

## Testing

### Backend
```go
// Unit test
func TestCreateCustomer(t *testing.T) {
    // Setup
    service := setupService()
    req := &dto.CreateCustomerRequest{Name: "Test"}
    
    // Execute
    result, err := service.CreateCustomer(context.Background(), 1, req)
    
    // Assert
    assert.NoError(t, err)
    assert.Equal(t, "Test", result.Name)
}
```

### Frontend
```dart
// Widget test
testWidgets('CustomerCard displays name', (tester) async {
  final customer = Customer(id: 1, name: 'Test');
  
  await tester.pumpWidget(
    MaterialApp(home: CustomerCard(customer: customer)),
  );
  
  expect(find.text('Test'), findsOneWidget);
});
```

---

## Git Workflow

### Commit Messages
```
✅ feat: add customer search
✅ fix: resolve order total calculation
✅ docs: update API documentation
✅ refactor: simplify auth service
✅ test: add customer service tests

❌ updated code
❌ fixed bug
```

### Branch Naming
```
✅ feature/customer-search
✅ fix/order-calculation
✅ refactor/auth-service

❌ my-feature
❌ fix
```

---

**Keep it simple. Keep it secure. Keep it maintainable.**

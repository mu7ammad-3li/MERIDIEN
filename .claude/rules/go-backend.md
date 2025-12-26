---
paths: backend/**/*.go
---

# Go Backend Coding Rules

## Package Structure
- Keep packages focused on single responsibility
- Use lowercase package names
- Avoid package name stuttering (e.g., `models.ModelUser` is bad)

## Naming Conventions
- **Exported:** `PascalCase` (e.g., `CustomerService`)
- **Unexported:** `camelCase` (e.g., `findByEmail`)
- **Interfaces:** Verb or noun (e.g., `Reader`, `Handler`)
- **Structs:** Noun (e.g., `Customer`, `Order`)

## Error Handling
- Always check errors: `if err != nil { return err }`
- Wrap errors with context: `fmt.Errorf("failed to create customer: %w", err)`
- Don't panic in library code
- Return errors, don't log and ignore

## Multi-Tenancy (CRITICAL)
Every database query MUST filter by tenant_id:
```go
// CORRECT
db.Where("tenant_id = ? AND id = ?", tenantID, id).First(&entity)

// WRONG - Missing tenant filter!
db.Where("id = ?", id).First(&entity)
```

## Repository Pattern
```go
// Create
func (r *Repository) Create(entity *Entity) error

// FindByID - Always include tenant filter
func (r *Repository) FindByID(tenantID, id uuid.UUID) (*Entity, error)

// List with pagination
func (r *Repository) List(tenantID uuid.UUID, page, perPage int) ([]Entity, int64, error)

// Update
func (r *Repository) Update(entity *Entity) error

// Delete (soft delete)
func (r *Repository) Delete(tenantID, id uuid.UUID) error
```

## Handler Pattern
```go
func (h *Handler) Create(c *gin.Context) {
    // 1. Get tenant from context
    tenantID := middleware.GetTenantID(c)

    // 2. Bind and validate request
    var req CreateRequest
    if err := c.ShouldBindJSON(&req); err != nil {
        utils.BadRequest(c, "Invalid request")
        return
    }

    // 3. Call service
    result, err := h.service.Create(tenantID, &req)
    if err != nil {
        utils.BadRequest(c, err.Error())
        return
    }

    // 4. Return response
    utils.Created(c, "Created successfully", result)
}
```

## Security Rules
1. Never log passwords or tokens
2. Use bcrypt for password hashing (cost 10)
3. Validate all inputs at handler level
4. Use parameterized queries (GORM does this)
5. Set appropriate CORS headers
6. Use HTTPS in production

## Dependencies
- Use dependency injection
- Initialize dependencies in `main.go`
- Pass dependencies to constructors

## Testing
- Test service layer business logic
- Mock repositories in tests
- Use table-driven tests

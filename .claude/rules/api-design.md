---
paths: backend/internal/handlers/**/*.go, backend/internal/router/**/*.go
---

# API Design Rules

## URL Structure
- Use plural nouns: `/customers`, `/products`, `/orders`
- Use lowercase with hyphens: `/order-items`
- Version prefix: `/api/v1/`
- Nested resources for relationships: `/orders/:id/payments`

## HTTP Methods
- `GET` - Read (list or single)
- `POST` - Create
- `PUT` - Update (full or partial)
- `DELETE` - Delete (soft delete)
- `PATCH` - Partial update (optional, can use PUT)

## Request/Response Format

### Success Response
```json
{
  "success": true,
  "message": "Resource created successfully",
  "data": { ... }
}
```

### Error Response
```json
{
  "success": false,
  "error": "Error code or short message",
  "message": "Detailed error description"
}
```

### Paginated Response
```json
{
  "success": true,
  "data": [ ... ],
  "meta": {
    "total": 100,
    "page": 1,
    "per_page": 20,
    "total_pages": 5
  }
}
```

## Status Codes
- `200 OK` - Success (GET, PUT, DELETE)
- `201 Created` - Resource created (POST)
- `400 Bad Request` - Validation error
- `401 Unauthorized` - Missing/invalid auth
- `403 Forbidden` - Not allowed
- `404 Not Found` - Resource doesn't exist
- `500 Internal Server Error` - Server error

## Query Parameters

### Pagination
- `page` - Page number (default: 1)
- `per_page` - Items per page (default: 20, max: 100)

### Filtering
- `status` - Filter by status
- `search` - Full-text search
- `from_date`, `to_date` - Date range

### Sorting
- `sort_by` - Field to sort by
- `sort_order` - `asc` or `desc`

Example:
```
GET /api/v1/customers?page=1&per_page=20&search=john&status=active&sort_by=created_at&sort_order=desc
```

## Authentication
- Bearer token in Authorization header
- Format: `Authorization: Bearer <jwt_token>`
- Token contains: user_id, tenant_id, email, role

## Endpoint Patterns

### CRUD Operations
```
GET    /api/v1/resources          # List with pagination
GET    /api/v1/resources/:id      # Get by ID
POST   /api/v1/resources          # Create
PUT    /api/v1/resources/:id      # Update
DELETE /api/v1/resources/:id      # Delete
```

### Status Transitions
```
POST /api/v1/orders/:id/confirm   # Confirm order
POST /api/v1/orders/:id/ship      # Ship order
POST /api/v1/orders/:id/deliver   # Deliver order
POST /api/v1/orders/:id/cancel    # Cancel order
```

### Nested Resources
```
GET  /api/v1/orders/:id/payments  # List payments
POST /api/v1/orders/:id/payments  # Record payment
```

## Validation
- Validate all inputs at handler level
- Return specific error messages
- Check required fields
- Validate data types and formats
- Check business rules in service layer

## Security
- All endpoints (except auth) require JWT
- Tenant isolation enforced
- Rate limiting recommended
- Input sanitization required

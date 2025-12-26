---
description: Test MERIDIEN API endpoints
allowed-tools: Bash
argument-hint: [endpoint]
---

Test MERIDIEN API endpoints.

## Get Authentication Token

```bash
TOKEN=$(curl -s -X POST http://localhost:8080/api/v1/auth/login \
  -H "Content-Type: application/json" \
  -d '{"tenant_slug":"demo","email":"admin@meridien.com","password":"Admin123"}' \
  | jq -r '.token')

echo "Token: $TOKEN"
```

## Test Specific Endpoint: $ARGUMENTS

If no endpoint specified, test health check:
```bash
curl -s http://localhost:8080/health | jq
```

## Common Endpoints

### Health
```bash
curl -s http://localhost:8080/health | jq
```

### Auth
```bash
# Login
curl -s -X POST http://localhost:8080/api/v1/auth/login \
  -H "Content-Type: application/json" \
  -d '{"tenant_slug":"demo","email":"admin@meridien.com","password":"Admin123"}' | jq

# Get current user
curl -s -H "Authorization: Bearer $TOKEN" http://localhost:8080/api/v1/auth/me | jq
```

### Customers
```bash
curl -s -H "Authorization: Bearer $TOKEN" http://localhost:8080/api/v1/customers | jq
```

### Products
```bash
curl -s -H "Authorization: Bearer $TOKEN" http://localhost:8080/api/v1/products | jq
```

### Orders
```bash
curl -s -H "Authorization: Bearer $TOKEN" http://localhost:8080/api/v1/orders | jq
```

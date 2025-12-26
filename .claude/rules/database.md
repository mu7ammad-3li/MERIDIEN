---
paths: backend/migrations/**/*.sql, backend/internal/models/**/*.go
---

# Database Design Rules

## Multi-Tenancy (CRITICAL)
Every table MUST include:
```sql
tenant_id UUID NOT NULL REFERENCES tenants(id) ON DELETE CASCADE
```

Include tenant_id in unique constraints:
```sql
UNIQUE(tenant_id, email)  -- Email unique per tenant
UNIQUE(tenant_id, sku)    -- SKU unique per tenant
```

## Standard Columns
Every table MUST have:
```sql
id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
tenant_id UUID NOT NULL REFERENCES tenants(id),
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
deleted_at TIMESTAMP  -- Soft delete
```

## Naming Conventions
- **Tables:** `snake_case`, plural (e.g., `order_items`)
- **Columns:** `snake_case`
- **Primary Key:** `id`
- **Foreign Key:** `{singular}_id` (e.g., `customer_id`)
- **Indexes:** `idx_{table}_{columns}`
- **Constraints:** `{table}_{type}_{columns}`

## Data Types
- **IDs:** `UUID`
- **Text:** `VARCHAR(n)` or `TEXT`
- **Money:** `DECIMAL(15,2)`
- **Quantity:** `INTEGER`
- **Boolean:** `BOOLEAN`
- **Date/Time:** `TIMESTAMP` or `DATE`
- **JSON:** `JSONB` (for flexible data)

## Indexes
Always create indexes for:
1. Foreign keys: `CREATE INDEX idx_table_fk_id ON table(fk_id);`
2. Tenant ID: `CREATE INDEX idx_table_tenant_id ON table(tenant_id);`
3. Status fields: `CREATE INDEX idx_table_status ON table(status);`
4. Frequently filtered columns
5. Full-text search: `CREATE INDEX idx_table_search ON table USING GIN(search_vector);`

## Soft Deletes
- Never hard delete records
- Use `deleted_at TIMESTAMP` column
- Filter by `WHERE deleted_at IS NULL`
- Index: `CREATE INDEX idx_table_deleted_at ON table(deleted_at);`

## Triggers
Add updated_at trigger to all tables:
```sql
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ language 'plpgsql';

CREATE TRIGGER update_table_updated_at
    BEFORE UPDATE ON table_name
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();
```

## Foreign Keys
- Define proper cascading behavior
- Use `ON DELETE CASCADE` for child records
- Use `ON DELETE SET NULL` for optional references
- Use `ON DELETE RESTRICT` for protected references

## Migration Files
- Name format: `NNNNNN_description.up.sql`
- Always create down migration: `NNNNNN_description.down.sql`
- Include seed data if needed
- Test rollback works

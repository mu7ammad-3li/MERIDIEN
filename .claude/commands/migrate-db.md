---
description: Run database migrations
allowed-tools: Bash
---

Run database migrations for MERIDIEN.

## Run All Migrations

```bash
cd /media/muhammad/Work/Identity/BM/MERIDIEN/backend
./scripts/run-migrations.sh
```

## Manual Migration

If script fails, run migrations manually with psql:

```bash
# Connect to database
psql -U postgres -d meridien_dev

# Run specific migration
\i migrations/000001_init_schema.up.sql
\i migrations/000002_create_customers.up.sql
\i migrations/000003_create_products.up.sql
\i migrations/000004_create_orders.up.sql
```

## Check Migration Status

```bash
psql -U postgres -d meridien_dev -c "\dt"
```

## Rollback Migration

```bash
# Rollback specific migration
psql -U postgres -d meridien_dev -f migrations/000004_create_orders.down.sql
```

## Create New Migration

Create new migration files:
```bash
# Create up migration
touch migrations/000005_description.up.sql

# Create down migration
touch migrations/000005_description.down.sql
```

Template for migration files is in `.claude/agents/db-architect.md`.

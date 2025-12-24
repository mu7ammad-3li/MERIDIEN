-- Drop triggers
DROP TRIGGER IF EXISTS update_users_updated_at ON users;
DROP TRIGGER IF EXISTS update_tenants_updated_at ON tenants;

-- Drop function
DROP FUNCTION IF EXISTS update_updated_at_column();

-- Drop tables
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS tenants;

-- Note: We don't drop the uuid-ossp extension as it might be used by other databases

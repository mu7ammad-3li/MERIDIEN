#!/bin/bash

echo "🗄️  Creating MERIDIEN database..."

# Create database as postgres user
sudo -u postgres createdb meridien_dev 2>/dev/null || echo "Database 'meridien_dev' already exists"

# Enable uuid extension
sudo -u postgres psql -d meridien_dev -c 'CREATE EXTENSION IF NOT EXISTS "uuid-ossp";' 2>/dev/null

# Grant privileges to current user
sudo -u postgres psql -d meridien_dev -c "CREATE USER muhammad WITH PASSWORD 'postgres';" 2>/dev/null || echo "User already exists"
sudo -u postgres psql -d meridien_dev -c "GRANT ALL PRIVILEGES ON DATABASE meridien_dev TO muhammad;" 2>/dev/null

echo "✅ Database setup complete!"

# Verify database
sudo -u postgres psql -d meridien_dev -c "SELECT current_database(), version();" -t | head -2

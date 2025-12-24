#!/bin/bash

echo "📦 Running database migrations..."

# Check if database exists
DB_EXISTS=$(sudo -u postgres psql -lqt | cut -d \| -f 1 | grep -w meridien_dev)

if [ -z "$DB_EXISTS" ]; then
    echo "❌ Database 'meridien_dev' does not exist. Please run ./scripts/create-database.sh first"
    exit 1
fi

# Run migrations
echo "⬆️  Running UP migrations..."
sudo -u postgres psql -d meridien_dev -f migrations/000001_init_schema.up.sql

if [ $? -eq 0 ]; then
    echo "✅ Migrations completed successfully!"
else
    echo "❌ Migration failed"
    exit 1
fi

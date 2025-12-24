#!/bin/bash

echo "🚀 Starting MERIDIEN server..."

# Check if database exists
DB_EXISTS=$(sudo -u postgres psql -lqt | cut -d \| -f 1 | grep -w meridien_dev 2>/dev/null)

if [ -z "$DB_EXISTS" ]; then
    echo "⚠️  Database 'meridien_dev' does not exist"
    echo "📝 Please run: ./scripts/create-database.sh"
    echo "📝 Then run: ./scripts/run-migrations.sh"
    exit 1
fi

# Start server
cd /media/muhammad/Work/Identity/BM/MERIDIEN/backend
go run cmd/server/main.go

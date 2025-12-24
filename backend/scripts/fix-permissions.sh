#!/bin/bash

echo "🔧 Fixing database permissions..."

# Grant schema permissions
sudo -u postgres psql -d meridien_dev << EOF
GRANT ALL ON SCHEMA public TO muhammad;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO muhammad;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO muhammad;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON TABLES TO muhammad;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON SEQUENCES TO muhammad;
EOF

echo "✅ Permissions fixed!"

# Verify
echo ""
echo "📊 Verifying database:"
psql -U muhammad -d meridien_dev -c "SELECT COUNT(*) as tenant_count FROM tenants;"
psql -U muhammad -d meridien_dev -c "SELECT COUNT(*) as user_count FROM users;"

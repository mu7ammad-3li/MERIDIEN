# MERIDIEN Backend

Multi-tenant Enterprise Retail & Inventory Digital Intelligence Engine - Backend API

Built with Go 1.21+, Gin Framework, and PostgreSQL 15+

## 🚀 Quick Start

### Prerequisites
- Go 1.21 or higher
- PostgreSQL 15 or higher

### Installation & Setup

1. **Create database** (requires sudo password):
```bash
cd /media/muhammad/Work/Identity/BM/MERIDIEN/backend
chmod +x scripts/create-database.sh
./scripts/create-database.sh
```

2. **Run migrations**:
```bash
chmod +x scripts/run-migrations.sh
./scripts/run-migrations.sh
```

3. **Start the server**:
```bash
chmod +x scripts/start-server.sh
./scripts/start-server.sh
```

Or run directly:
```bash
go run cmd/server/main.go
```

### Verify Installation

Once the server is running, test these endpoints:

- Health check: http://localhost:8080/health
- API ping: http://localhost:8080/api/v1/ping

Expected output:
```json
{
  "status": "healthy",
  "service": "MERIDIEN API",
  "time": "2024-12-24T01:48:00Z"
}
```

## 📁 Project Structure

```
backend/
├── cmd/
│   └── server/          # Application entry point
├── internal/
│   ├── config/          # Configuration management
│   ├── database/        # Database connection
│   ├── models/          # Data models
│   ├── repositories/    # Data access layer
│   ├── services/        # Business logic
│   ├── handlers/        # HTTP handlers
│   ├── middleware/      # HTTP middleware
│   ├── router/          # Route definitions
│   └── utils/           # Utility functions
├── migrations/          # SQL migrations
├── configs/             # Configuration files (.env)
└── scripts/             # Utility scripts
```

## 🔧 Configuration

Environment variables are loaded from `configs/.env`:

```env
# Application
APP_NAME=MERIDIEN
APP_ENV=development
APP_PORT=8080
APP_DEBUG=true

# Database
DB_HOST=localhost
DB_PORT=5432
DB_USER=postgres
DB_PASSWORD=postgres
DB_NAME=meridien_dev

# JWT
JWT_SECRET=your-secret-key
JWT_EXPIRATION_HOURS=24
```

## 📊 Database Schema

### Current Tables (v0.0.1)

- **tenants**: Multi-tenant organizations
- **users**: User accounts with RBAC

See `migrations/` for detailed schema.

## 🛠️ Development

### Running in Development Mode

```bash
# Install Air for hot reload (optional)
go install github.com/air-verse/air@latest

# Run with hot reload
air
```

### Manual Server Start

```bash
go run cmd/server/main.go
```

## 📝 API Endpoints

### Health & Status
- `GET /health` - Health check

### API v1
- `GET /api/v1/ping` - API test endpoint

### Authentication (Coming Soon)
- `POST /api/v1/auth/register` - Register new user
- `POST /api/v1/auth/login` - User login
- `POST /api/v1/auth/logout` - User logout
- `GET /api/v1/auth/me` - Get current user

## 🧪 Testing

```bash
# Run all tests
go test ./...

# Run tests with coverage
go test -cover ./...

# Run specific package tests
go test ./internal/services/...
```

## 📦 Dependencies

Core dependencies:
- **gin-gonic/gin** - HTTP web framework
- **gorm.io/gorm** - ORM
- **gorm.io/driver/postgres** - PostgreSQL driver
- **golang-jwt/jwt** - JWT authentication
- **spf13/viper** - Configuration management
- **google/uuid** - UUID generation
- **golang.org/x/crypto** - Password hashing

See `go.mod` for complete dependency list.

## 🔐 Security

- Passwords hashed with bcrypt
- JWT for authentication
- SQL injection prevention via GORM
- Input validation on all endpoints
- Tenant isolation enforced at database level

## 📖 Documentation

- [Development Rules](../docs/DEVELOPMENT-RULES.md)
- [MVP Plan](../docs/plan-three.md)
- [Getting Started](../docs/GETTING-STARTED.md)

## 🐛 Troubleshooting

### Database Connection Failed

```bash
# Check if PostgreSQL is running
sudo systemctl status postgresql

# Verify database exists
psql -U postgres -l | grep meridien_dev
```

### Port Already in Use

```bash
# Find process using port 8080
lsof -i :8080

# Kill the process
kill -9 <PID>
```

## 📄 License

Proprietary - All rights reserved

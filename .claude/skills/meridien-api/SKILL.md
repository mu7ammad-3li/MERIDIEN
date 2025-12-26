---
name: meridien-api
description: Build and extend MERIDIEN backend APIs. Use when creating new endpoints, services, or repositories in Go/Gin. Includes patterns for handlers, services, repositories, and models.
allowed-tools: Read, Grep, Glob, Bash, Edit, Write
---

# MERIDIEN API Development Skill

## What This Skill Does

Helps you build backend API endpoints following MERIDIEN's architecture patterns:
- Clean Architecture (Handler → Service → Repository)
- Multi-tenant data isolation
- Standard response formats
- Proper error handling

## When to Use

Use this skill when:
- Creating new API endpoints
- Adding new business entities
- Extending existing modules
- Working with database operations

## Project Structure

```
backend/
├── cmd/server/main.go           # Entry point
├── internal/
│   ├── config/config.go         # Configuration
│   ├── database/database.go     # DB connection
│   ├── models/                  # GORM models
│   ├── repositories/            # Data access layer
│   ├── services/                # Business logic
│   ├── handlers/                # HTTP handlers
│   ├── middleware/              # JWT, CORS, etc.
│   ├── utils/                   # Helpers (jwt, response, validator)
│   └── router/router.go         # Route definitions
└── migrations/                  # SQL migrations
```

## Creating a New Module

### Step 1: Create Model
`internal/models/{entity}.go`

```go
package models

import (
    "time"
    "github.com/google/uuid"
    "github.com/shopspring/decimal"
)

type Entity struct {
    Base
    TenantID    uuid.UUID       `gorm:"type:uuid;not null;index" json:"tenant_id"`
    Name        string          `gorm:"size:255;not null" json:"name"`
    Status      string          `gorm:"size:50;default:'active'" json:"status"`
    Amount      decimal.Decimal `gorm:"type:decimal(15,2)" json:"amount"`
    // Relations
    Tenant      *Tenant         `gorm:"foreignKey:TenantID" json:"-"`
}

func (e *Entity) BeforeCreate(tx *gorm.DB) error {
    if e.ID == uuid.Nil {
        e.ID = uuid.New()
    }
    return nil
}
```

### Step 2: Create Repository
`internal/repositories/{entity}_repository.go`

```go
package repositories

type EntityRepository struct {
    db *gorm.DB
}

func NewEntityRepository(db *gorm.DB) *EntityRepository {
    return &EntityRepository{db: db}
}

func (r *EntityRepository) Create(entity *models.Entity) error {
    return r.db.Create(entity).Error
}

func (r *EntityRepository) FindByID(tenantID, id uuid.UUID) (*models.Entity, error) {
    var entity models.Entity
    err := r.db.Where("tenant_id = ? AND id = ? AND deleted_at IS NULL", tenantID, id).First(&entity).Error
    if err != nil {
        return nil, err
    }
    return &entity, nil
}

func (r *EntityRepository) List(tenantID uuid.UUID, page, perPage int) ([]models.Entity, int64, error) {
    var entities []models.Entity
    var total int64

    query := r.db.Where("tenant_id = ? AND deleted_at IS NULL", tenantID)
    query.Model(&models.Entity{}).Count(&total)

    offset := (page - 1) * perPage
    err := query.Offset(offset).Limit(perPage).Order("created_at DESC").Find(&entities).Error

    return entities, total, err
}

func (r *EntityRepository) Update(entity *models.Entity) error {
    return r.db.Save(entity).Error
}

func (r *EntityRepository) Delete(tenantID, id uuid.UUID) error {
    return r.db.Where("tenant_id = ? AND id = ?", tenantID, id).Delete(&models.Entity{}).Error
}
```

### Step 3: Create Service
`internal/services/{entity}_service.go`

```go
package services

type EntityService struct {
    repo *repositories.EntityRepository
}

func NewEntityService(repo *repositories.EntityRepository) *EntityService {
    return &EntityService{repo: repo}
}

func (s *EntityService) Create(tenantID uuid.UUID, req *CreateEntityRequest) (*models.Entity, error) {
    // Validation
    if req.Name == "" {
        return nil, errors.New("name is required")
    }

    entity := &models.Entity{
        TenantID: tenantID,
        Name:     strings.TrimSpace(req.Name),
        Status:   "active",
    }

    if err := s.repo.Create(entity); err != nil {
        return nil, err
    }

    return entity, nil
}

func (s *EntityService) GetByID(tenantID, id uuid.UUID) (*models.Entity, error) {
    return s.repo.FindByID(tenantID, id)
}

func (s *EntityService) List(tenantID uuid.UUID, page, perPage int) ([]models.Entity, int64, error) {
    return s.repo.List(tenantID, page, perPage)
}
```

### Step 4: Create Handler
`internal/handlers/{entity}_handler.go`

```go
package handlers

type EntityHandler struct {
    service *services.EntityService
}

func NewEntityHandler(service *services.EntityService) *EntityHandler {
    return &EntityHandler{service: service}
}

func (h *EntityHandler) Create(c *gin.Context) {
    tenantID := middleware.GetTenantID(c)

    var req CreateEntityRequest
    if err := c.ShouldBindJSON(&req); err != nil {
        utils.BadRequest(c, "Invalid request body")
        return
    }

    entity, err := h.service.Create(tenantID, &req)
    if err != nil {
        utils.BadRequest(c, err.Error())
        return
    }

    utils.Created(c, "Entity created successfully", entity)
}

func (h *EntityHandler) List(c *gin.Context) {
    tenantID := middleware.GetTenantID(c)
    page, _ := strconv.Atoi(c.DefaultQuery("page", "1"))
    perPage, _ := strconv.Atoi(c.DefaultQuery("per_page", "20"))

    entities, total, err := h.service.List(tenantID, page, perPage)
    if err != nil {
        utils.InternalError(c, "Failed to fetch entities")
        return
    }

    utils.Paginated(c, entities, total, page, perPage)
}

func (h *EntityHandler) GetByID(c *gin.Context) {
    tenantID := middleware.GetTenantID(c)
    id, err := uuid.Parse(c.Param("id"))
    if err != nil {
        utils.BadRequest(c, "Invalid ID format")
        return
    }

    entity, err := h.service.GetByID(tenantID, id)
    if err != nil {
        utils.NotFound(c, "Entity not found")
        return
    }

    utils.Success(c, "Entity retrieved successfully", entity)
}
```

### Step 5: Add Routes
`internal/router/router.go`

```go
// In SetupRouter function
entities := api.Group("/entities")
entities.Use(middleware.AuthMiddleware(jwtSecret))
{
    entities.GET("", entityHandler.List)
    entities.GET("/:id", entityHandler.GetByID)
    entities.POST("", entityHandler.Create)
    entities.PUT("/:id", entityHandler.Update)
    entities.DELETE("/:id", entityHandler.Delete)
}
```

### Step 6: Wire Dependencies
`cmd/server/main.go`

```go
// Initialize repository
entityRepo := repositories.NewEntityRepository(db)

// Initialize service
entityService := services.NewEntityService(entityRepo)

// Initialize handler
entityHandler := handlers.NewEntityHandler(entityService)

// Pass to router
router.SetupRouter(cfg, db, ..., entityHandler)
```

## Response Utilities

Use `internal/utils/response.go`:

```go
utils.Success(c, "Message", data)      // 200
utils.Created(c, "Message", data)      // 201
utils.BadRequest(c, "Error message")   // 400
utils.Unauthorized(c, "Error message") // 401
utils.NotFound(c, "Error message")     // 404
utils.InternalError(c, "Error message") // 500
utils.Paginated(c, data, total, page, perPage) // With meta
```

## Reference Files

- Existing handler: `internal/handlers/customer_handler.go`
- Existing service: `internal/services/customer_service.go`
- Existing repository: `internal/repositories/customer_repository.go`
- Existing model: `internal/models/customer.go`

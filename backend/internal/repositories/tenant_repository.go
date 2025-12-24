package repositories

import (
	"errors"

	"github.com/google/uuid"
	"github.com/mu7ammad-3li/MERIDIEN/backend/internal/models"
	"gorm.io/gorm"
)

// TenantRepository handles database operations for tenants
type TenantRepository struct {
	db *gorm.DB
}

// NewTenantRepository creates a new tenant repository instance
func NewTenantRepository(db *gorm.DB) *TenantRepository {
	return &TenantRepository{db: db}
}

// Create creates a new tenant
func (r *TenantRepository) Create(tenant *models.Tenant) error {
	return r.db.Create(tenant).Error
}

// FindByID finds a tenant by ID
func (r *TenantRepository) FindByID(id uuid.UUID) (*models.Tenant, error) {
	var tenant models.Tenant
	err := r.db.Where("id = ?", id).First(&tenant).Error

	if err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			return nil, errors.New("tenant not found")
		}
		return nil, err
	}

	return &tenant, nil
}

// FindBySlug finds a tenant by slug
func (r *TenantRepository) FindBySlug(slug string) (*models.Tenant, error) {
	var tenant models.Tenant
	err := r.db.Where("slug = ?", slug).First(&tenant).Error

	if err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			return nil, errors.New("tenant not found")
		}
		return nil, err
	}

	return &tenant, nil
}

// Update updates a tenant's information
func (r *TenantRepository) Update(tenant *models.Tenant) error {
	return r.db.Save(tenant).Error
}

// Delete soft deletes a tenant
func (r *TenantRepository) Delete(id uuid.UUID) error {
	result := r.db.Where("id = ?", id).Delete(&models.Tenant{})

	if result.Error != nil {
		return result.Error
	}

	if result.RowsAffected == 0 {
		return errors.New("tenant not found")
	}

	return nil
}

// ExistsBySlug checks if a tenant with the given slug exists
func (r *TenantRepository) ExistsBySlug(slug string) (bool, error) {
	var count int64
	err := r.db.Model(&models.Tenant{}).
		Where("slug = ?", slug).
		Count(&count).Error
	return count > 0, err
}

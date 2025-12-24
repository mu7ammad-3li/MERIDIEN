package repositories

import (
	"github.com/google/uuid"
	"github.com/mu7ammad-3li/MERIDIEN/backend/internal/models"
	"github.com/shopspring/decimal"
	"gorm.io/gorm"
)

// PaymentRepository handles database operations for payments
type PaymentRepository struct {
	db *gorm.DB
}

// NewPaymentRepository creates a new payment repository instance
func NewPaymentRepository(db *gorm.DB) *PaymentRepository {
	return &PaymentRepository{db: db}
}

// Create creates a new payment
func (r *PaymentRepository) Create(payment *models.Payment) error {
	return r.db.Create(payment).Error
}

// FindByID finds a payment by ID
func (r *PaymentRepository) FindByID(id uuid.UUID, tenantID uuid.UUID) (*models.Payment, error) {
	var payment models.Payment
	err := r.db.Where("id = ? AND tenant_id = ?", id, tenantID).
		Preload("Order").
		First(&payment).Error

	if err != nil {
		return nil, err
	}

	return &payment, nil
}

// ListByOrder returns all payments for an order
func (r *PaymentRepository) ListByOrder(orderID uuid.UUID, tenantID uuid.UUID) ([]models.Payment, error) {
	var payments []models.Payment
	err := r.db.Where("order_id = ? AND tenant_id = ?", orderID, tenantID).
		Order("payment_date DESC").
		Find(&payments).Error

	if err != nil {
		return nil, err
	}

	return payments, nil
}

// List returns a paginated list of payments
func (r *PaymentRepository) List(tenantID uuid.UUID, limit, offset int) ([]models.Payment, int64, error) {
	var payments []models.Payment
	var total int64

	query := r.db.Model(&models.Payment{}).Where("tenant_id = ?", tenantID)

	// Count total
	if err := query.Count(&total).Error; err != nil {
		return nil, 0, err
	}

	// Get payments with pagination
	err := query.
		Order("payment_date DESC").
		Limit(limit).
		Offset(offset).
		Preload("Order").
		Find(&payments).Error

	if err != nil {
		return nil, 0, err
	}

	return payments, total, nil
}

// Update updates a payment
func (r *PaymentRepository) Update(payment *models.Payment) error {
	return r.db.Save(payment).Error
}

// Delete soft deletes a payment
func (r *PaymentRepository) Delete(id uuid.UUID, tenantID uuid.UUID) error {
	return r.db.Where("id = ? AND tenant_id = ?", id, tenantID).
		Delete(&models.Payment{}).Error
}

// GetTotalByOrder returns the total amount paid for an order
func (r *PaymentRepository) GetTotalByOrder(orderID uuid.UUID, tenantID uuid.UUID) (decimal.Decimal, error) {
	var total struct {
		Sum string
	}

	err := r.db.Model(&models.Payment{}).
		Select("COALESCE(SUM(amount), 0) as sum").
		Where("order_id = ? AND tenant_id = ? AND status = ?", orderID, tenantID, "completed").
		Scan(&total).Error

	if err != nil {
		return decimal.Zero, err
	}

	amount, err := decimal.NewFromString(total.Sum)
	if err != nil {
		return decimal.Zero, err
	}

	return amount, nil
}

// CountByOrder returns the number of payments for an order
func (r *PaymentRepository) CountByOrder(orderID uuid.UUID, tenantID uuid.UUID) (int64, error) {
	var count int64
	err := r.db.Model(&models.Payment{}).
		Where("order_id = ? AND tenant_id = ?", orderID, tenantID).
		Count(&count).Error
	return count, err
}

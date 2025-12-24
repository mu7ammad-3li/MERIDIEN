package models

import (
	"database/sql/driver"
	"encoding/json"
	"errors"

	"github.com/google/uuid"
	"gorm.io/gorm"
)

// JSONB is a custom type for JSONB columns
type JSONB map[string]interface{}

// Value implements the driver.Valuer interface
func (j JSONB) Value() (driver.Value, error) {
	if j == nil {
		return "{}", nil
	}
	return json.Marshal(j)
}

// Scan implements the sql.Scanner interface
func (j *JSONB) Scan(value interface{}) error {
	if value == nil {
		*j = make(JSONB)
		return nil
	}

	bytes, ok := value.([]byte)
	if !ok {
		return errors.New("failed to scan JSONB value")
	}

	return json.Unmarshal(bytes, j)
}

// Tenant represents a business/organization using the system
type Tenant struct {
	BaseModel
	Name               string `gorm:"type:varchar(255);not null" json:"name"`
	Slug               string `gorm:"type:varchar(255);not null;uniqueIndex" json:"slug"`
	SubscriptionPlan   string `gorm:"type:varchar(50);not null;default:'trial'" json:"subscription_plan"`
	SubscriptionStatus string `gorm:"type:varchar(50);not null;default:'active'" json:"subscription_status"`
	MaxUsers           int    `gorm:"not null;default:5" json:"max_users"`
	MaxProducts        int    `gorm:"not null;default:100" json:"max_products"`
	Settings           JSONB  `gorm:"type:jsonb;default:'{}'" json:"settings"`
}

// TableName specifies the table name for Tenant
func (Tenant) TableName() string {
	return "tenants"
}

// BeforeCreate hook to validate tenant before creation
func (t *Tenant) BeforeCreate(tx *gorm.DB) error {
	// Call parent BeforeCreate for UUID generation
	if t.ID == uuid.Nil {
		t.ID = uuid.New()
	}

	// Set default values if not provided
	if t.SubscriptionPlan == "" {
		t.SubscriptionPlan = "trial"
	}
	if t.SubscriptionStatus == "" {
		t.SubscriptionStatus = "active"
	}
	if t.MaxUsers == 0 {
		t.MaxUsers = 5
	}
	if t.MaxProducts == 0 {
		t.MaxProducts = 100
	}

	return nil
}

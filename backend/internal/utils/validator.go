package utils

import (
	"errors"
	"regexp"
	"strings"
)

// Email validation regex
var emailRegex = regexp.MustCompile(`^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$`)

// ValidateEmail validates an email address
func ValidateEmail(email string) error {
	email = strings.TrimSpace(email)

	if email == "" {
		return errors.New("email is required")
	}

	if !emailRegex.MatchString(email) {
		return errors.New("invalid email format")
	}

	return nil
}

// ValidatePassword validates a password
func ValidatePassword(password string) error {
	if password == "" {
		return errors.New("password is required")
	}

	if len(password) < 8 {
		return errors.New("password must be at least 8 characters long")
	}

	if len(password) > 128 {
		return errors.New("password must be less than 128 characters")
	}

	// Check for at least one uppercase letter
	hasUpper := false
	hasLower := false
	hasDigit := false

	for _, char := range password {
		switch {
		case char >= 'A' && char <= 'Z':
			hasUpper = true
		case char >= 'a' && char <= 'z':
			hasLower = true
		case char >= '0' && char <= '9':
			hasDigit = true
		}
	}

	if !hasUpper {
		return errors.New("password must contain at least one uppercase letter")
	}

	if !hasLower {
		return errors.New("password must contain at least one lowercase letter")
	}

	if !hasDigit {
		return errors.New("password must contain at least one digit")
	}

	return nil
}

// ValidateName validates a name field (first name or last name)
func ValidateName(name, fieldName string) error {
	name = strings.TrimSpace(name)

	if name == "" {
		return errors.New(fieldName + " is required")
	}

	if len(name) < 2 {
		return errors.New(fieldName + " must be at least 2 characters long")
	}

	if len(name) > 100 {
		return errors.New(fieldName + " must be less than 100 characters")
	}

	return nil
}

// ValidateRole validates a user role
func ValidateRole(role string) error {
	validRoles := map[string]bool{
		"admin":   true,
		"manager": true,
		"user":    true,
		"cashier": true,
	}

	if role == "" {
		return errors.New("role is required")
	}

	if !validRoles[role] {
		return errors.New("invalid role. Must be one of: admin, manager, user, cashier")
	}

	return nil
}

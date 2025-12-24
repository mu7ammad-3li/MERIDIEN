import 'package:flutter/material.dart';

/// App color palette for MERIDIEN
class AppColors {
  AppColors._();

  // Primary Colors
  static const Color primary = Color(0xFF2563EB); // Blue
  static const Color primaryLight = Color(0xFF60A5FA);
  static const Color primaryDark = Color(0xFF1E40AF);

  // Secondary Colors
  static const Color secondary = Color(0xFF10B981); // Green
  static const Color secondaryLight = Color(0xFF34D399);
  static const Color secondaryDark = Color(0xFF059669);

  // Status Colors
  static const Color success = Color(0xFF10B981); // Green
  static const Color error = Color(0xFFEF4444); // Red
  static const Color warning = Color(0xFFF59E0B); // Amber
  static const Color info = Color(0xFF3B82F6); // Blue

  // Neutral Colors
  static const Color background = Color(0xFFF9FAFB); // Light Gray
  static const Color backgroundLight = Color(0xFFF3F4F6); // Very Light Gray
  static const Color backgroundDark = Color(0xFF111827);
  static const Color surface = Color(0xFFFFFFFF); // White
  static const Color surfaceDark = Color(0xFF1F2937);

  // Text Colors
  static const Color textPrimary = Color(0xFF111827); // Dark Gray
  static const Color textSecondary = Color(0xFF6B7280); // Medium Gray
  static const Color textDisabled = Color(0xFF9CA3AF); // Light Gray
  static const Color textWhite = Color(0xFFFFFFFF);

  // Border Colors
  static const Color border = Color(0xFFE5E7EB);
  static const Color borderDark = Color(0xFF374151);

  // Order Status Colors
  static const Color orderStatusDraft = Color(0xFF9CA3AF); // Gray
  static const Color orderStatusPending = Color(0xFFF59E0B); // Amber
  static const Color orderStatusConfirmed = Color(0xFF3B82F6); // Blue
  static const Color orderStatusProcessing = Color(0xFF8B5CF6); // Purple
  static const Color orderStatusShipped = Color(0xFF06B6D4); // Cyan
  static const Color orderStatusDelivered = Color(0xFF10B981); // Green
  static const Color orderStatusCancelled = Color(0xFFEF4444); // Red

  // Payment Status Colors
  static const Color paymentStatusUnpaid = Color(0xFFEF4444); // Red
  static const Color paymentStatusPartial = Color(0xFFF59E0B); // Amber
  static const Color paymentStatusPaid = Color(0xFF10B981); // Green
  static const Color paymentStatusOverdue = Color(0xFFDC2626); // Dark Red
  static const Color paymentStatusRefunded = Color(0xFF6B7280); // Gray

  // Stock Status Colors
  static const Color stockInStock = Color(0xFF10B981); // Green
  static const Color stockLowStock = Color(0xFFF59E0B); // Amber
  static const Color stockOutOfStock = Color(0xFFEF4444); // Red

  // Gradient Colors
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primary, primaryDark],
  );

  static const LinearGradient successGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [success, secondaryDark],
  );
}

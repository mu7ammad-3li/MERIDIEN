import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_model.freezed.dart';
part 'order_model.g.dart';

@freezed
class OrderModel with _$OrderModel {
  const factory OrderModel({
    required String id,
    @JsonKey(name: 'tenant_id') required String tenantId,
    @JsonKey(name: 'order_number') required String orderNumber,
    @JsonKey(name: 'customer_id') required String customerId,
    @JsonKey(name: 'customer_name') String? customerName,
    @JsonKey(name: 'customer_email') String? customerEmail,
    required String status,
    @JsonKey(name: 'order_date') required DateTime orderDate,
    @JsonKey(name: 'delivery_date') DateTime? deliveryDate,
    @JsonKey(name: 'shipping_address') String? shippingAddress,
    @JsonKey(name: 'shipping_city') String? shippingCity,
    @JsonKey(name: 'shipping_state') String? shippingState,
    @JsonKey(name: 'shipping_postal_code') String? shippingPostalCode,
    @JsonKey(name: 'shipping_country') String? shippingCountry,
    @JsonKey(name: 'billing_address') String? billingAddress,
    @JsonKey(name: 'billing_city') String? billingCity,
    @JsonKey(name: 'billing_state') String? billingState,
    @JsonKey(name: 'billing_postal_code') String? billingPostalCode,
    @JsonKey(name: 'billing_country') String? billingCountry,
    @JsonKey(name: 'subtotal') required String subtotal,
    @JsonKey(name: 'tax_amount') required String taxAmount,
    @JsonKey(name: 'discount_amount') String? discountAmount,
    @JsonKey(name: 'shipping_cost') String? shippingCost,
    @JsonKey(name: 'total_amount') required String totalAmount,
    @JsonKey(name: 'payment_status') required String paymentStatus,
    @JsonKey(name: 'payment_method') String? paymentMethod,
    String? notes,
    @JsonKey(name: 'internal_notes') String? internalNotes,
    List<OrderItemModel>? items,
    List<PaymentModel>? payments,
    @JsonKey(name: 'custom_fields') Map<String, dynamic>? customFields,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _OrderModel;

  const OrderModel._();

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  String get shippingAddressFull {
    final parts = [
      shippingAddress,
      shippingCity,
      shippingState,
      shippingPostalCode,
      shippingCountry,
    ].where((p) => p != null && p.isNotEmpty);
    return parts.join(', ');
  }

  String get billingAddressFull {
    final parts = [
      billingAddress,
      billingCity,
      billingState,
      billingPostalCode,
      billingCountry,
    ].where((p) => p != null && p.isNotEmpty);
    return parts.join(', ');
  }

  double get subtotalAmount => double.tryParse(subtotal) ?? 0.0;
  double get taxAmountValue => double.tryParse(taxAmount) ?? 0.0;
  double get discountAmountValue => double.tryParse(discountAmount ?? '0') ?? 0.0;
  double get shippingCostValue => double.tryParse(shippingCost ?? '0') ?? 0.0;
  double get totalAmountValue => double.tryParse(totalAmount) ?? 0.0;

  int get itemCount => items?.length ?? 0;

  double get totalPaid {
    if (payments == null || payments!.isEmpty) return 0.0;
    return payments!.fold(0.0, (sum, payment) => sum + payment.amountValue);
  }

  double get balanceDue => totalAmountValue - totalPaid;

  bool get isPaid => paymentStatus == 'paid';
  bool get isPartiallyPaid => paymentStatus == 'partially_paid';
  bool get isPending => paymentStatus == 'pending';
  bool get isOverdue => paymentStatus == 'overdue';

  bool get isDraft => status == 'draft';
  bool get isConfirmed => status == 'confirmed';
  bool get isProcessing => status == 'processing';
  bool get isShipped => status == 'shipped';
  bool get isDelivered => status == 'delivered';
  bool get isCancelled => status == 'cancelled';
}

@freezed
class OrderItemModel with _$OrderItemModel {
  const factory OrderItemModel({
    required String id,
    @JsonKey(name: 'order_id') required String orderId,
    @JsonKey(name: 'product_id') required String productId,
    @JsonKey(name: 'product_name') required String productName,
    @JsonKey(name: 'product_sku') String? productSku,
    required int quantity,
    @JsonKey(name: 'unit_price') required String unitPrice,
    @JsonKey(name: 'tax_rate') String? taxRate,
    @JsonKey(name: 'tax_amount') String? taxAmount,
    @JsonKey(name: 'discount_amount') String? discountAmount,
    @JsonKey(name: 'line_total') required String lineTotal,
    String? notes,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _OrderItemModel;

  const OrderItemModel._();

  factory OrderItemModel.fromJson(Map<String, dynamic> json) =>
      _$OrderItemModelFromJson(json);

  double get unitPriceValue => double.tryParse(unitPrice) ?? 0.0;
  double get taxRateValue => double.tryParse(taxRate ?? '0') ?? 0.0;
  double get taxAmountValue => double.tryParse(taxAmount ?? '0') ?? 0.0;
  double get discountAmountValue => double.tryParse(discountAmount ?? '0') ?? 0.0;
  double get lineTotalValue => double.tryParse(lineTotal) ?? 0.0;
}

@freezed
class PaymentModel with _$PaymentModel {
  const factory PaymentModel({
    required String id,
    @JsonKey(name: 'order_id') required String orderId,
    @JsonKey(name: 'payment_date') required DateTime paymentDate,
    required String amount,
    @JsonKey(name: 'payment_method') required String paymentMethod,
    @JsonKey(name: 'transaction_id') String? transactionId,
    String? reference,
    String? notes,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _PaymentModel;

  const PaymentModel._();

  factory PaymentModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentModelFromJson(json);

  double get amountValue => double.tryParse(amount) ?? 0.0;
}

// Create Order Request
@freezed
class CreateOrderRequest with _$CreateOrderRequest {
  const factory CreateOrderRequest({
    @JsonKey(name: 'customer_id') required String customerId,
    required String status,
    @JsonKey(name: 'order_date') required DateTime orderDate,
    @JsonKey(name: 'delivery_date') DateTime? deliveryDate,
    @JsonKey(name: 'shipping_address') String? shippingAddress,
    @JsonKey(name: 'shipping_city') String? shippingCity,
    @JsonKey(name: 'shipping_state') String? shippingState,
    @JsonKey(name: 'shipping_postal_code') String? shippingPostalCode,
    @JsonKey(name: 'shipping_country') String? shippingCountry,
    @JsonKey(name: 'billing_address') String? billingAddress,
    @JsonKey(name: 'billing_city') String? billingCity,
    @JsonKey(name: 'billing_state') String? billingState,
    @JsonKey(name: 'billing_postal_code') String? billingPostalCode,
    @JsonKey(name: 'billing_country') String? billingCountry,
    @JsonKey(name: 'discount_amount') String? discountAmount,
    @JsonKey(name: 'shipping_cost') String? shippingCost,
    @JsonKey(name: 'payment_method') String? paymentMethod,
    String? notes,
    @JsonKey(name: 'internal_notes') String? internalNotes,
    required List<CreateOrderItemRequest> items,
  }) = _CreateOrderRequest;

  factory CreateOrderRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateOrderRequestFromJson(json);
}

@freezed
class CreateOrderItemRequest with _$CreateOrderItemRequest {
  const factory CreateOrderItemRequest({
    @JsonKey(name: 'product_id') required String productId,
    required int quantity,
    @JsonKey(name: 'unit_price') required String unitPrice,
    @JsonKey(name: 'discount_amount') String? discountAmount,
    String? notes,
  }) = _CreateOrderItemRequest;

  factory CreateOrderItemRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateOrderItemRequestFromJson(json);
}

// Update Order Request
@freezed
class UpdateOrderRequest with _$UpdateOrderRequest {
  const factory UpdateOrderRequest({
    String? status,
    @JsonKey(name: 'delivery_date') DateTime? deliveryDate,
    @JsonKey(name: 'shipping_address') String? shippingAddress,
    @JsonKey(name: 'shipping_city') String? shippingCity,
    @JsonKey(name: 'shipping_state') String? shippingState,
    @JsonKey(name: 'shipping_postal_code') String? shippingPostalCode,
    @JsonKey(name: 'shipping_country') String? shippingCountry,
    @JsonKey(name: 'billing_address') String? billingAddress,
    @JsonKey(name: 'billing_city') String? billingCity,
    @JsonKey(name: 'billing_state') String? billingState,
    @JsonKey(name: 'billing_postal_code') String? billingPostalCode,
    @JsonKey(name: 'billing_country') String? billingCountry,
    @JsonKey(name: 'discount_amount') String? discountAmount,
    @JsonKey(name: 'shipping_cost') String? shippingCost,
    @JsonKey(name: 'payment_method') String? paymentMethod,
    String? notes,
    @JsonKey(name: 'internal_notes') String? internalNotes,
  }) = _UpdateOrderRequest;

  factory UpdateOrderRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateOrderRequestFromJson(json);
}

// Record Payment Request
@freezed
class RecordPaymentRequest with _$RecordPaymentRequest {
  const factory RecordPaymentRequest({
    required String amount,
    @JsonKey(name: 'payment_method') required String paymentMethod,
    @JsonKey(name: 'payment_date') required DateTime paymentDate,
    @JsonKey(name: 'transaction_id') String? transactionId,
    String? reference,
    String? notes,
  }) = _RecordPaymentRequest;

  factory RecordPaymentRequest.fromJson(Map<String, dynamic> json) =>
      _$RecordPaymentRequestFromJson(json);
}

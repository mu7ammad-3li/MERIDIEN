// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderModelImpl _$$OrderModelImplFromJson(Map<String, dynamic> json) =>
    _$OrderModelImpl(
      id: json['id'] as String,
      tenantId: json['tenant_id'] as String,
      orderNumber: json['order_number'] as String,
      customerId: json['customer_id'] as String,
      customerName: json['customer_name'] as String?,
      customerEmail: json['customer_email'] as String?,
      status: json['status'] as String,
      orderDate: DateTime.parse(json['order_date'] as String),
      deliveryDate: json['delivery_date'] == null
          ? null
          : DateTime.parse(json['delivery_date'] as String),
      shippingAddress: json['shipping_address'] as String?,
      shippingCity: json['shipping_city'] as String?,
      shippingState: json['shipping_state'] as String?,
      shippingPostalCode: json['shipping_postal_code'] as String?,
      shippingCountry: json['shipping_country'] as String?,
      billingAddress: json['billing_address'] as String?,
      billingCity: json['billing_city'] as String?,
      billingState: json['billing_state'] as String?,
      billingPostalCode: json['billing_postal_code'] as String?,
      billingCountry: json['billing_country'] as String?,
      subtotal: json['subtotal'] as String,
      taxAmount: json['tax_amount'] as String,
      discountAmount: json['discount_amount'] as String?,
      shippingCost: json['shipping_cost'] as String?,
      totalAmount: json['total_amount'] as String,
      paymentStatus: json['payment_status'] as String,
      paymentMethod: json['payment_method'] as String?,
      notes: json['notes'] as String?,
      internalNotes: json['internal_notes'] as String?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => OrderItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      payments: (json['payments'] as List<dynamic>?)
          ?.map((e) => PaymentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      customFields: json['custom_fields'] as Map<String, dynamic>?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$OrderModelImplToJson(_$OrderModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tenant_id': instance.tenantId,
      'order_number': instance.orderNumber,
      'customer_id': instance.customerId,
      'customer_name': instance.customerName,
      'customer_email': instance.customerEmail,
      'status': instance.status,
      'order_date': instance.orderDate.toIso8601String(),
      'delivery_date': instance.deliveryDate?.toIso8601String(),
      'shipping_address': instance.shippingAddress,
      'shipping_city': instance.shippingCity,
      'shipping_state': instance.shippingState,
      'shipping_postal_code': instance.shippingPostalCode,
      'shipping_country': instance.shippingCountry,
      'billing_address': instance.billingAddress,
      'billing_city': instance.billingCity,
      'billing_state': instance.billingState,
      'billing_postal_code': instance.billingPostalCode,
      'billing_country': instance.billingCountry,
      'subtotal': instance.subtotal,
      'tax_amount': instance.taxAmount,
      'discount_amount': instance.discountAmount,
      'shipping_cost': instance.shippingCost,
      'total_amount': instance.totalAmount,
      'payment_status': instance.paymentStatus,
      'payment_method': instance.paymentMethod,
      'notes': instance.notes,
      'internal_notes': instance.internalNotes,
      'items': instance.items,
      'payments': instance.payments,
      'custom_fields': instance.customFields,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

_$OrderItemModelImpl _$$OrderItemModelImplFromJson(Map<String, dynamic> json) =>
    _$OrderItemModelImpl(
      id: json['id'] as String,
      orderId: json['order_id'] as String,
      productId: json['product_id'] as String,
      productName: json['product_name'] as String,
      productSku: json['product_sku'] as String?,
      quantity: (json['quantity'] as num).toInt(),
      unitPrice: json['unit_price'] as String,
      taxRate: json['tax_rate'] as String?,
      taxAmount: json['tax_amount'] as String?,
      discountAmount: json['discount_amount'] as String?,
      lineTotal: json['line_total'] as String,
      notes: json['notes'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$OrderItemModelImplToJson(
        _$OrderItemModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order_id': instance.orderId,
      'product_id': instance.productId,
      'product_name': instance.productName,
      'product_sku': instance.productSku,
      'quantity': instance.quantity,
      'unit_price': instance.unitPrice,
      'tax_rate': instance.taxRate,
      'tax_amount': instance.taxAmount,
      'discount_amount': instance.discountAmount,
      'line_total': instance.lineTotal,
      'notes': instance.notes,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

_$PaymentModelImpl _$$PaymentModelImplFromJson(Map<String, dynamic> json) =>
    _$PaymentModelImpl(
      id: json['id'] as String,
      orderId: json['order_id'] as String,
      paymentDate: DateTime.parse(json['payment_date'] as String),
      amount: json['amount'] as String,
      paymentMethod: json['payment_method'] as String,
      transactionId: json['transaction_id'] as String?,
      reference: json['reference'] as String?,
      notes: json['notes'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$PaymentModelImplToJson(_$PaymentModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order_id': instance.orderId,
      'payment_date': instance.paymentDate.toIso8601String(),
      'amount': instance.amount,
      'payment_method': instance.paymentMethod,
      'transaction_id': instance.transactionId,
      'reference': instance.reference,
      'notes': instance.notes,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

_$CreateOrderRequestImpl _$$CreateOrderRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateOrderRequestImpl(
      customerId: json['customer_id'] as String,
      status: json['status'] as String,
      orderDate: DateTime.parse(json['order_date'] as String),
      deliveryDate: json['delivery_date'] == null
          ? null
          : DateTime.parse(json['delivery_date'] as String),
      shippingAddress: json['shipping_address'] as String?,
      shippingCity: json['shipping_city'] as String?,
      shippingState: json['shipping_state'] as String?,
      shippingPostalCode: json['shipping_postal_code'] as String?,
      shippingCountry: json['shipping_country'] as String?,
      billingAddress: json['billing_address'] as String?,
      billingCity: json['billing_city'] as String?,
      billingState: json['billing_state'] as String?,
      billingPostalCode: json['billing_postal_code'] as String?,
      billingCountry: json['billing_country'] as String?,
      discountAmount: json['discount_amount'] as String?,
      shippingCost: json['shipping_cost'] as String?,
      paymentMethod: json['payment_method'] as String?,
      notes: json['notes'] as String?,
      internalNotes: json['internal_notes'] as String?,
      items: (json['items'] as List<dynamic>)
          .map(
              (e) => CreateOrderItemRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CreateOrderRequestImplToJson(
        _$CreateOrderRequestImpl instance) =>
    <String, dynamic>{
      'customer_id': instance.customerId,
      'status': instance.status,
      'order_date': instance.orderDate.toIso8601String(),
      'delivery_date': instance.deliveryDate?.toIso8601String(),
      'shipping_address': instance.shippingAddress,
      'shipping_city': instance.shippingCity,
      'shipping_state': instance.shippingState,
      'shipping_postal_code': instance.shippingPostalCode,
      'shipping_country': instance.shippingCountry,
      'billing_address': instance.billingAddress,
      'billing_city': instance.billingCity,
      'billing_state': instance.billingState,
      'billing_postal_code': instance.billingPostalCode,
      'billing_country': instance.billingCountry,
      'discount_amount': instance.discountAmount,
      'shipping_cost': instance.shippingCost,
      'payment_method': instance.paymentMethod,
      'notes': instance.notes,
      'internal_notes': instance.internalNotes,
      'items': instance.items,
    };

_$CreateOrderItemRequestImpl _$$CreateOrderItemRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateOrderItemRequestImpl(
      productId: json['product_id'] as String,
      quantity: (json['quantity'] as num).toInt(),
      unitPrice: json['unit_price'] as String,
      discountAmount: json['discount_amount'] as String?,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$CreateOrderItemRequestImplToJson(
        _$CreateOrderItemRequestImpl instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
      'quantity': instance.quantity,
      'unit_price': instance.unitPrice,
      'discount_amount': instance.discountAmount,
      'notes': instance.notes,
    };

_$UpdateOrderRequestImpl _$$UpdateOrderRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdateOrderRequestImpl(
      status: json['status'] as String?,
      deliveryDate: json['delivery_date'] == null
          ? null
          : DateTime.parse(json['delivery_date'] as String),
      shippingAddress: json['shipping_address'] as String?,
      shippingCity: json['shipping_city'] as String?,
      shippingState: json['shipping_state'] as String?,
      shippingPostalCode: json['shipping_postal_code'] as String?,
      shippingCountry: json['shipping_country'] as String?,
      billingAddress: json['billing_address'] as String?,
      billingCity: json['billing_city'] as String?,
      billingState: json['billing_state'] as String?,
      billingPostalCode: json['billing_postal_code'] as String?,
      billingCountry: json['billing_country'] as String?,
      discountAmount: json['discount_amount'] as String?,
      shippingCost: json['shipping_cost'] as String?,
      paymentMethod: json['payment_method'] as String?,
      notes: json['notes'] as String?,
      internalNotes: json['internal_notes'] as String?,
    );

Map<String, dynamic> _$$UpdateOrderRequestImplToJson(
        _$UpdateOrderRequestImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'delivery_date': instance.deliveryDate?.toIso8601String(),
      'shipping_address': instance.shippingAddress,
      'shipping_city': instance.shippingCity,
      'shipping_state': instance.shippingState,
      'shipping_postal_code': instance.shippingPostalCode,
      'shipping_country': instance.shippingCountry,
      'billing_address': instance.billingAddress,
      'billing_city': instance.billingCity,
      'billing_state': instance.billingState,
      'billing_postal_code': instance.billingPostalCode,
      'billing_country': instance.billingCountry,
      'discount_amount': instance.discountAmount,
      'shipping_cost': instance.shippingCost,
      'payment_method': instance.paymentMethod,
      'notes': instance.notes,
      'internal_notes': instance.internalNotes,
    };

_$RecordPaymentRequestImpl _$$RecordPaymentRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$RecordPaymentRequestImpl(
      amount: json['amount'] as String,
      paymentMethod: json['payment_method'] as String,
      paymentDate: DateTime.parse(json['payment_date'] as String),
      transactionId: json['transaction_id'] as String?,
      reference: json['reference'] as String?,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$RecordPaymentRequestImplToJson(
        _$RecordPaymentRequestImpl instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'payment_method': instance.paymentMethod,
      'payment_date': instance.paymentDate.toIso8601String(),
      'transaction_id': instance.transactionId,
      'reference': instance.reference,
      'notes': instance.notes,
    };

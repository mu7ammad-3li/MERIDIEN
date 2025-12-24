// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) {
  return _OrderModel.fromJson(json);
}

/// @nodoc
mixin _$OrderModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'tenant_id')
  String get tenantId => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_number')
  String get orderNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_id')
  String get customerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_name')
  String? get customerName => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_email')
  String? get customerEmail => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_date')
  DateTime get orderDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_date')
  DateTime? get deliveryDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'shipping_address')
  String? get shippingAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'shipping_city')
  String? get shippingCity => throw _privateConstructorUsedError;
  @JsonKey(name: 'shipping_state')
  String? get shippingState => throw _privateConstructorUsedError;
  @JsonKey(name: 'shipping_postal_code')
  String? get shippingPostalCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'shipping_country')
  String? get shippingCountry => throw _privateConstructorUsedError;
  @JsonKey(name: 'billing_address')
  String? get billingAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'billing_city')
  String? get billingCity => throw _privateConstructorUsedError;
  @JsonKey(name: 'billing_state')
  String? get billingState => throw _privateConstructorUsedError;
  @JsonKey(name: 'billing_postal_code')
  String? get billingPostalCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'billing_country')
  String? get billingCountry => throw _privateConstructorUsedError;
  @JsonKey(name: 'subtotal')
  String get subtotal => throw _privateConstructorUsedError;
  @JsonKey(name: 'tax_amount')
  String get taxAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount_amount')
  String? get discountAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'shipping_cost')
  String? get shippingCost => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_amount')
  String get totalAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_status')
  String get paymentStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_method')
  String? get paymentMethod => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(name: 'internal_notes')
  String? get internalNotes => throw _privateConstructorUsedError;
  List<OrderItemModel>? get items => throw _privateConstructorUsedError;
  List<PaymentModel>? get payments => throw _privateConstructorUsedError;
  @JsonKey(name: 'custom_fields')
  Map<String, dynamic>? get customFields => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderModelCopyWith<OrderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderModelCopyWith<$Res> {
  factory $OrderModelCopyWith(
          OrderModel value, $Res Function(OrderModel) then) =
      _$OrderModelCopyWithImpl<$Res, OrderModel>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'tenant_id') String tenantId,
      @JsonKey(name: 'order_number') String orderNumber,
      @JsonKey(name: 'customer_id') String customerId,
      @JsonKey(name: 'customer_name') String? customerName,
      @JsonKey(name: 'customer_email') String? customerEmail,
      String status,
      @JsonKey(name: 'order_date') DateTime orderDate,
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
      @JsonKey(name: 'subtotal') String subtotal,
      @JsonKey(name: 'tax_amount') String taxAmount,
      @JsonKey(name: 'discount_amount') String? discountAmount,
      @JsonKey(name: 'shipping_cost') String? shippingCost,
      @JsonKey(name: 'total_amount') String totalAmount,
      @JsonKey(name: 'payment_status') String paymentStatus,
      @JsonKey(name: 'payment_method') String? paymentMethod,
      String? notes,
      @JsonKey(name: 'internal_notes') String? internalNotes,
      List<OrderItemModel>? items,
      List<PaymentModel>? payments,
      @JsonKey(name: 'custom_fields') Map<String, dynamic>? customFields,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class _$OrderModelCopyWithImpl<$Res, $Val extends OrderModel>
    implements $OrderModelCopyWith<$Res> {
  _$OrderModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tenantId = null,
    Object? orderNumber = null,
    Object? customerId = null,
    Object? customerName = freezed,
    Object? customerEmail = freezed,
    Object? status = null,
    Object? orderDate = null,
    Object? deliveryDate = freezed,
    Object? shippingAddress = freezed,
    Object? shippingCity = freezed,
    Object? shippingState = freezed,
    Object? shippingPostalCode = freezed,
    Object? shippingCountry = freezed,
    Object? billingAddress = freezed,
    Object? billingCity = freezed,
    Object? billingState = freezed,
    Object? billingPostalCode = freezed,
    Object? billingCountry = freezed,
    Object? subtotal = null,
    Object? taxAmount = null,
    Object? discountAmount = freezed,
    Object? shippingCost = freezed,
    Object? totalAmount = null,
    Object? paymentStatus = null,
    Object? paymentMethod = freezed,
    Object? notes = freezed,
    Object? internalNotes = freezed,
    Object? items = freezed,
    Object? payments = freezed,
    Object? customFields = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      tenantId: null == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String,
      orderNumber: null == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: freezed == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String?,
      customerEmail: freezed == customerEmail
          ? _value.customerEmail
          : customerEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      orderDate: null == orderDate
          ? _value.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deliveryDate: freezed == deliveryDate
          ? _value.deliveryDate
          : deliveryDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      shippingAddress: freezed == shippingAddress
          ? _value.shippingAddress
          : shippingAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      shippingCity: freezed == shippingCity
          ? _value.shippingCity
          : shippingCity // ignore: cast_nullable_to_non_nullable
              as String?,
      shippingState: freezed == shippingState
          ? _value.shippingState
          : shippingState // ignore: cast_nullable_to_non_nullable
              as String?,
      shippingPostalCode: freezed == shippingPostalCode
          ? _value.shippingPostalCode
          : shippingPostalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      shippingCountry: freezed == shippingCountry
          ? _value.shippingCountry
          : shippingCountry // ignore: cast_nullable_to_non_nullable
              as String?,
      billingAddress: freezed == billingAddress
          ? _value.billingAddress
          : billingAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      billingCity: freezed == billingCity
          ? _value.billingCity
          : billingCity // ignore: cast_nullable_to_non_nullable
              as String?,
      billingState: freezed == billingState
          ? _value.billingState
          : billingState // ignore: cast_nullable_to_non_nullable
              as String?,
      billingPostalCode: freezed == billingPostalCode
          ? _value.billingPostalCode
          : billingPostalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      billingCountry: freezed == billingCountry
          ? _value.billingCountry
          : billingCountry // ignore: cast_nullable_to_non_nullable
              as String?,
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as String,
      taxAmount: null == taxAmount
          ? _value.taxAmount
          : taxAmount // ignore: cast_nullable_to_non_nullable
              as String,
      discountAmount: freezed == discountAmount
          ? _value.discountAmount
          : discountAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      shippingCost: freezed == shippingCost
          ? _value.shippingCost
          : shippingCost // ignore: cast_nullable_to_non_nullable
              as String?,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as String,
      paymentStatus: null == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      internalNotes: freezed == internalNotes
          ? _value.internalNotes
          : internalNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      items: freezed == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<OrderItemModel>?,
      payments: freezed == payments
          ? _value.payments
          : payments // ignore: cast_nullable_to_non_nullable
              as List<PaymentModel>?,
      customFields: freezed == customFields
          ? _value.customFields
          : customFields // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderModelImplCopyWith<$Res>
    implements $OrderModelCopyWith<$Res> {
  factory _$$OrderModelImplCopyWith(
          _$OrderModelImpl value, $Res Function(_$OrderModelImpl) then) =
      __$$OrderModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'tenant_id') String tenantId,
      @JsonKey(name: 'order_number') String orderNumber,
      @JsonKey(name: 'customer_id') String customerId,
      @JsonKey(name: 'customer_name') String? customerName,
      @JsonKey(name: 'customer_email') String? customerEmail,
      String status,
      @JsonKey(name: 'order_date') DateTime orderDate,
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
      @JsonKey(name: 'subtotal') String subtotal,
      @JsonKey(name: 'tax_amount') String taxAmount,
      @JsonKey(name: 'discount_amount') String? discountAmount,
      @JsonKey(name: 'shipping_cost') String? shippingCost,
      @JsonKey(name: 'total_amount') String totalAmount,
      @JsonKey(name: 'payment_status') String paymentStatus,
      @JsonKey(name: 'payment_method') String? paymentMethod,
      String? notes,
      @JsonKey(name: 'internal_notes') String? internalNotes,
      List<OrderItemModel>? items,
      List<PaymentModel>? payments,
      @JsonKey(name: 'custom_fields') Map<String, dynamic>? customFields,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class __$$OrderModelImplCopyWithImpl<$Res>
    extends _$OrderModelCopyWithImpl<$Res, _$OrderModelImpl>
    implements _$$OrderModelImplCopyWith<$Res> {
  __$$OrderModelImplCopyWithImpl(
      _$OrderModelImpl _value, $Res Function(_$OrderModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tenantId = null,
    Object? orderNumber = null,
    Object? customerId = null,
    Object? customerName = freezed,
    Object? customerEmail = freezed,
    Object? status = null,
    Object? orderDate = null,
    Object? deliveryDate = freezed,
    Object? shippingAddress = freezed,
    Object? shippingCity = freezed,
    Object? shippingState = freezed,
    Object? shippingPostalCode = freezed,
    Object? shippingCountry = freezed,
    Object? billingAddress = freezed,
    Object? billingCity = freezed,
    Object? billingState = freezed,
    Object? billingPostalCode = freezed,
    Object? billingCountry = freezed,
    Object? subtotal = null,
    Object? taxAmount = null,
    Object? discountAmount = freezed,
    Object? shippingCost = freezed,
    Object? totalAmount = null,
    Object? paymentStatus = null,
    Object? paymentMethod = freezed,
    Object? notes = freezed,
    Object? internalNotes = freezed,
    Object? items = freezed,
    Object? payments = freezed,
    Object? customFields = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$OrderModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      tenantId: null == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String,
      orderNumber: null == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: freezed == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String?,
      customerEmail: freezed == customerEmail
          ? _value.customerEmail
          : customerEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      orderDate: null == orderDate
          ? _value.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deliveryDate: freezed == deliveryDate
          ? _value.deliveryDate
          : deliveryDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      shippingAddress: freezed == shippingAddress
          ? _value.shippingAddress
          : shippingAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      shippingCity: freezed == shippingCity
          ? _value.shippingCity
          : shippingCity // ignore: cast_nullable_to_non_nullable
              as String?,
      shippingState: freezed == shippingState
          ? _value.shippingState
          : shippingState // ignore: cast_nullable_to_non_nullable
              as String?,
      shippingPostalCode: freezed == shippingPostalCode
          ? _value.shippingPostalCode
          : shippingPostalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      shippingCountry: freezed == shippingCountry
          ? _value.shippingCountry
          : shippingCountry // ignore: cast_nullable_to_non_nullable
              as String?,
      billingAddress: freezed == billingAddress
          ? _value.billingAddress
          : billingAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      billingCity: freezed == billingCity
          ? _value.billingCity
          : billingCity // ignore: cast_nullable_to_non_nullable
              as String?,
      billingState: freezed == billingState
          ? _value.billingState
          : billingState // ignore: cast_nullable_to_non_nullable
              as String?,
      billingPostalCode: freezed == billingPostalCode
          ? _value.billingPostalCode
          : billingPostalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      billingCountry: freezed == billingCountry
          ? _value.billingCountry
          : billingCountry // ignore: cast_nullable_to_non_nullable
              as String?,
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as String,
      taxAmount: null == taxAmount
          ? _value.taxAmount
          : taxAmount // ignore: cast_nullable_to_non_nullable
              as String,
      discountAmount: freezed == discountAmount
          ? _value.discountAmount
          : discountAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      shippingCost: freezed == shippingCost
          ? _value.shippingCost
          : shippingCost // ignore: cast_nullable_to_non_nullable
              as String?,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as String,
      paymentStatus: null == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      internalNotes: freezed == internalNotes
          ? _value.internalNotes
          : internalNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      items: freezed == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<OrderItemModel>?,
      payments: freezed == payments
          ? _value._payments
          : payments // ignore: cast_nullable_to_non_nullable
              as List<PaymentModel>?,
      customFields: freezed == customFields
          ? _value._customFields
          : customFields // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderModelImpl extends _OrderModel {
  const _$OrderModelImpl(
      {required this.id,
      @JsonKey(name: 'tenant_id') required this.tenantId,
      @JsonKey(name: 'order_number') required this.orderNumber,
      @JsonKey(name: 'customer_id') required this.customerId,
      @JsonKey(name: 'customer_name') this.customerName,
      @JsonKey(name: 'customer_email') this.customerEmail,
      required this.status,
      @JsonKey(name: 'order_date') required this.orderDate,
      @JsonKey(name: 'delivery_date') this.deliveryDate,
      @JsonKey(name: 'shipping_address') this.shippingAddress,
      @JsonKey(name: 'shipping_city') this.shippingCity,
      @JsonKey(name: 'shipping_state') this.shippingState,
      @JsonKey(name: 'shipping_postal_code') this.shippingPostalCode,
      @JsonKey(name: 'shipping_country') this.shippingCountry,
      @JsonKey(name: 'billing_address') this.billingAddress,
      @JsonKey(name: 'billing_city') this.billingCity,
      @JsonKey(name: 'billing_state') this.billingState,
      @JsonKey(name: 'billing_postal_code') this.billingPostalCode,
      @JsonKey(name: 'billing_country') this.billingCountry,
      @JsonKey(name: 'subtotal') required this.subtotal,
      @JsonKey(name: 'tax_amount') required this.taxAmount,
      @JsonKey(name: 'discount_amount') this.discountAmount,
      @JsonKey(name: 'shipping_cost') this.shippingCost,
      @JsonKey(name: 'total_amount') required this.totalAmount,
      @JsonKey(name: 'payment_status') required this.paymentStatus,
      @JsonKey(name: 'payment_method') this.paymentMethod,
      this.notes,
      @JsonKey(name: 'internal_notes') this.internalNotes,
      final List<OrderItemModel>? items,
      final List<PaymentModel>? payments,
      @JsonKey(name: 'custom_fields') final Map<String, dynamic>? customFields,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt})
      : _items = items,
        _payments = payments,
        _customFields = customFields,
        super._();

  factory _$OrderModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'tenant_id')
  final String tenantId;
  @override
  @JsonKey(name: 'order_number')
  final String orderNumber;
  @override
  @JsonKey(name: 'customer_id')
  final String customerId;
  @override
  @JsonKey(name: 'customer_name')
  final String? customerName;
  @override
  @JsonKey(name: 'customer_email')
  final String? customerEmail;
  @override
  final String status;
  @override
  @JsonKey(name: 'order_date')
  final DateTime orderDate;
  @override
  @JsonKey(name: 'delivery_date')
  final DateTime? deliveryDate;
  @override
  @JsonKey(name: 'shipping_address')
  final String? shippingAddress;
  @override
  @JsonKey(name: 'shipping_city')
  final String? shippingCity;
  @override
  @JsonKey(name: 'shipping_state')
  final String? shippingState;
  @override
  @JsonKey(name: 'shipping_postal_code')
  final String? shippingPostalCode;
  @override
  @JsonKey(name: 'shipping_country')
  final String? shippingCountry;
  @override
  @JsonKey(name: 'billing_address')
  final String? billingAddress;
  @override
  @JsonKey(name: 'billing_city')
  final String? billingCity;
  @override
  @JsonKey(name: 'billing_state')
  final String? billingState;
  @override
  @JsonKey(name: 'billing_postal_code')
  final String? billingPostalCode;
  @override
  @JsonKey(name: 'billing_country')
  final String? billingCountry;
  @override
  @JsonKey(name: 'subtotal')
  final String subtotal;
  @override
  @JsonKey(name: 'tax_amount')
  final String taxAmount;
  @override
  @JsonKey(name: 'discount_amount')
  final String? discountAmount;
  @override
  @JsonKey(name: 'shipping_cost')
  final String? shippingCost;
  @override
  @JsonKey(name: 'total_amount')
  final String totalAmount;
  @override
  @JsonKey(name: 'payment_status')
  final String paymentStatus;
  @override
  @JsonKey(name: 'payment_method')
  final String? paymentMethod;
  @override
  final String? notes;
  @override
  @JsonKey(name: 'internal_notes')
  final String? internalNotes;
  final List<OrderItemModel>? _items;
  @override
  List<OrderItemModel>? get items {
    final value = _items;
    if (value == null) return null;
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<PaymentModel>? _payments;
  @override
  List<PaymentModel>? get payments {
    final value = _payments;
    if (value == null) return null;
    if (_payments is EqualUnmodifiableListView) return _payments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final Map<String, dynamic>? _customFields;
  @override
  @JsonKey(name: 'custom_fields')
  Map<String, dynamic>? get customFields {
    final value = _customFields;
    if (value == null) return null;
    if (_customFields is EqualUnmodifiableMapView) return _customFields;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'OrderModel(id: $id, tenantId: $tenantId, orderNumber: $orderNumber, customerId: $customerId, customerName: $customerName, customerEmail: $customerEmail, status: $status, orderDate: $orderDate, deliveryDate: $deliveryDate, shippingAddress: $shippingAddress, shippingCity: $shippingCity, shippingState: $shippingState, shippingPostalCode: $shippingPostalCode, shippingCountry: $shippingCountry, billingAddress: $billingAddress, billingCity: $billingCity, billingState: $billingState, billingPostalCode: $billingPostalCode, billingCountry: $billingCountry, subtotal: $subtotal, taxAmount: $taxAmount, discountAmount: $discountAmount, shippingCost: $shippingCost, totalAmount: $totalAmount, paymentStatus: $paymentStatus, paymentMethod: $paymentMethod, notes: $notes, internalNotes: $internalNotes, items: $items, payments: $payments, customFields: $customFields, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.tenantId, tenantId) ||
                other.tenantId == tenantId) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.customerEmail, customerEmail) ||
                other.customerEmail == customerEmail) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.orderDate, orderDate) ||
                other.orderDate == orderDate) &&
            (identical(other.deliveryDate, deliveryDate) ||
                other.deliveryDate == deliveryDate) &&
            (identical(other.shippingAddress, shippingAddress) ||
                other.shippingAddress == shippingAddress) &&
            (identical(other.shippingCity, shippingCity) ||
                other.shippingCity == shippingCity) &&
            (identical(other.shippingState, shippingState) ||
                other.shippingState == shippingState) &&
            (identical(other.shippingPostalCode, shippingPostalCode) ||
                other.shippingPostalCode == shippingPostalCode) &&
            (identical(other.shippingCountry, shippingCountry) ||
                other.shippingCountry == shippingCountry) &&
            (identical(other.billingAddress, billingAddress) ||
                other.billingAddress == billingAddress) &&
            (identical(other.billingCity, billingCity) ||
                other.billingCity == billingCity) &&
            (identical(other.billingState, billingState) ||
                other.billingState == billingState) &&
            (identical(other.billingPostalCode, billingPostalCode) ||
                other.billingPostalCode == billingPostalCode) &&
            (identical(other.billingCountry, billingCountry) ||
                other.billingCountry == billingCountry) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.taxAmount, taxAmount) ||
                other.taxAmount == taxAmount) &&
            (identical(other.discountAmount, discountAmount) ||
                other.discountAmount == discountAmount) &&
            (identical(other.shippingCost, shippingCost) ||
                other.shippingCost == shippingCost) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.paymentStatus, paymentStatus) ||
                other.paymentStatus == paymentStatus) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.internalNotes, internalNotes) ||
                other.internalNotes == internalNotes) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            const DeepCollectionEquality().equals(other._payments, _payments) &&
            const DeepCollectionEquality()
                .equals(other._customFields, _customFields) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        tenantId,
        orderNumber,
        customerId,
        customerName,
        customerEmail,
        status,
        orderDate,
        deliveryDate,
        shippingAddress,
        shippingCity,
        shippingState,
        shippingPostalCode,
        shippingCountry,
        billingAddress,
        billingCity,
        billingState,
        billingPostalCode,
        billingCountry,
        subtotal,
        taxAmount,
        discountAmount,
        shippingCost,
        totalAmount,
        paymentStatus,
        paymentMethod,
        notes,
        internalNotes,
        const DeepCollectionEquality().hash(_items),
        const DeepCollectionEquality().hash(_payments),
        const DeepCollectionEquality().hash(_customFields),
        createdAt,
        updatedAt
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderModelImplCopyWith<_$OrderModelImpl> get copyWith =>
      __$$OrderModelImplCopyWithImpl<_$OrderModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderModelImplToJson(
      this,
    );
  }
}

abstract class _OrderModel extends OrderModel {
  const factory _OrderModel(
      {required final String id,
      @JsonKey(name: 'tenant_id') required final String tenantId,
      @JsonKey(name: 'order_number') required final String orderNumber,
      @JsonKey(name: 'customer_id') required final String customerId,
      @JsonKey(name: 'customer_name') final String? customerName,
      @JsonKey(name: 'customer_email') final String? customerEmail,
      required final String status,
      @JsonKey(name: 'order_date') required final DateTime orderDate,
      @JsonKey(name: 'delivery_date') final DateTime? deliveryDate,
      @JsonKey(name: 'shipping_address') final String? shippingAddress,
      @JsonKey(name: 'shipping_city') final String? shippingCity,
      @JsonKey(name: 'shipping_state') final String? shippingState,
      @JsonKey(name: 'shipping_postal_code') final String? shippingPostalCode,
      @JsonKey(name: 'shipping_country') final String? shippingCountry,
      @JsonKey(name: 'billing_address') final String? billingAddress,
      @JsonKey(name: 'billing_city') final String? billingCity,
      @JsonKey(name: 'billing_state') final String? billingState,
      @JsonKey(name: 'billing_postal_code') final String? billingPostalCode,
      @JsonKey(name: 'billing_country') final String? billingCountry,
      @JsonKey(name: 'subtotal') required final String subtotal,
      @JsonKey(name: 'tax_amount') required final String taxAmount,
      @JsonKey(name: 'discount_amount') final String? discountAmount,
      @JsonKey(name: 'shipping_cost') final String? shippingCost,
      @JsonKey(name: 'total_amount') required final String totalAmount,
      @JsonKey(name: 'payment_status') required final String paymentStatus,
      @JsonKey(name: 'payment_method') final String? paymentMethod,
      final String? notes,
      @JsonKey(name: 'internal_notes') final String? internalNotes,
      final List<OrderItemModel>? items,
      final List<PaymentModel>? payments,
      @JsonKey(name: 'custom_fields') final Map<String, dynamic>? customFields,
      @JsonKey(name: 'created_at') final DateTime? createdAt,
      @JsonKey(name: 'updated_at')
      final DateTime? updatedAt}) = _$OrderModelImpl;
  const _OrderModel._() : super._();

  factory _OrderModel.fromJson(Map<String, dynamic> json) =
      _$OrderModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'tenant_id')
  String get tenantId;
  @override
  @JsonKey(name: 'order_number')
  String get orderNumber;
  @override
  @JsonKey(name: 'customer_id')
  String get customerId;
  @override
  @JsonKey(name: 'customer_name')
  String? get customerName;
  @override
  @JsonKey(name: 'customer_email')
  String? get customerEmail;
  @override
  String get status;
  @override
  @JsonKey(name: 'order_date')
  DateTime get orderDate;
  @override
  @JsonKey(name: 'delivery_date')
  DateTime? get deliveryDate;
  @override
  @JsonKey(name: 'shipping_address')
  String? get shippingAddress;
  @override
  @JsonKey(name: 'shipping_city')
  String? get shippingCity;
  @override
  @JsonKey(name: 'shipping_state')
  String? get shippingState;
  @override
  @JsonKey(name: 'shipping_postal_code')
  String? get shippingPostalCode;
  @override
  @JsonKey(name: 'shipping_country')
  String? get shippingCountry;
  @override
  @JsonKey(name: 'billing_address')
  String? get billingAddress;
  @override
  @JsonKey(name: 'billing_city')
  String? get billingCity;
  @override
  @JsonKey(name: 'billing_state')
  String? get billingState;
  @override
  @JsonKey(name: 'billing_postal_code')
  String? get billingPostalCode;
  @override
  @JsonKey(name: 'billing_country')
  String? get billingCountry;
  @override
  @JsonKey(name: 'subtotal')
  String get subtotal;
  @override
  @JsonKey(name: 'tax_amount')
  String get taxAmount;
  @override
  @JsonKey(name: 'discount_amount')
  String? get discountAmount;
  @override
  @JsonKey(name: 'shipping_cost')
  String? get shippingCost;
  @override
  @JsonKey(name: 'total_amount')
  String get totalAmount;
  @override
  @JsonKey(name: 'payment_status')
  String get paymentStatus;
  @override
  @JsonKey(name: 'payment_method')
  String? get paymentMethod;
  @override
  String? get notes;
  @override
  @JsonKey(name: 'internal_notes')
  String? get internalNotes;
  @override
  List<OrderItemModel>? get items;
  @override
  List<PaymentModel>? get payments;
  @override
  @JsonKey(name: 'custom_fields')
  Map<String, dynamic>? get customFields;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$OrderModelImplCopyWith<_$OrderModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderItemModel _$OrderItemModelFromJson(Map<String, dynamic> json) {
  return _OrderItemModel.fromJson(json);
}

/// @nodoc
mixin _$OrderItemModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_id')
  String get orderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_id')
  String get productId => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_name')
  String get productName => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_sku')
  String? get productSku => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'unit_price')
  String get unitPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'tax_rate')
  String? get taxRate => throw _privateConstructorUsedError;
  @JsonKey(name: 'tax_amount')
  String? get taxAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount_amount')
  String? get discountAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'line_total')
  String get lineTotal => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderItemModelCopyWith<OrderItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderItemModelCopyWith<$Res> {
  factory $OrderItemModelCopyWith(
          OrderItemModel value, $Res Function(OrderItemModel) then) =
      _$OrderItemModelCopyWithImpl<$Res, OrderItemModel>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'order_id') String orderId,
      @JsonKey(name: 'product_id') String productId,
      @JsonKey(name: 'product_name') String productName,
      @JsonKey(name: 'product_sku') String? productSku,
      int quantity,
      @JsonKey(name: 'unit_price') String unitPrice,
      @JsonKey(name: 'tax_rate') String? taxRate,
      @JsonKey(name: 'tax_amount') String? taxAmount,
      @JsonKey(name: 'discount_amount') String? discountAmount,
      @JsonKey(name: 'line_total') String lineTotal,
      String? notes,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class _$OrderItemModelCopyWithImpl<$Res, $Val extends OrderItemModel>
    implements $OrderItemModelCopyWith<$Res> {
  _$OrderItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderId = null,
    Object? productId = null,
    Object? productName = null,
    Object? productSku = freezed,
    Object? quantity = null,
    Object? unitPrice = null,
    Object? taxRate = freezed,
    Object? taxAmount = freezed,
    Object? discountAmount = freezed,
    Object? lineTotal = null,
    Object? notes = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      productSku: freezed == productSku
          ? _value.productSku
          : productSku // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      unitPrice: null == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as String,
      taxRate: freezed == taxRate
          ? _value.taxRate
          : taxRate // ignore: cast_nullable_to_non_nullable
              as String?,
      taxAmount: freezed == taxAmount
          ? _value.taxAmount
          : taxAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      discountAmount: freezed == discountAmount
          ? _value.discountAmount
          : discountAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      lineTotal: null == lineTotal
          ? _value.lineTotal
          : lineTotal // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderItemModelImplCopyWith<$Res>
    implements $OrderItemModelCopyWith<$Res> {
  factory _$$OrderItemModelImplCopyWith(_$OrderItemModelImpl value,
          $Res Function(_$OrderItemModelImpl) then) =
      __$$OrderItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'order_id') String orderId,
      @JsonKey(name: 'product_id') String productId,
      @JsonKey(name: 'product_name') String productName,
      @JsonKey(name: 'product_sku') String? productSku,
      int quantity,
      @JsonKey(name: 'unit_price') String unitPrice,
      @JsonKey(name: 'tax_rate') String? taxRate,
      @JsonKey(name: 'tax_amount') String? taxAmount,
      @JsonKey(name: 'discount_amount') String? discountAmount,
      @JsonKey(name: 'line_total') String lineTotal,
      String? notes,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class __$$OrderItemModelImplCopyWithImpl<$Res>
    extends _$OrderItemModelCopyWithImpl<$Res, _$OrderItemModelImpl>
    implements _$$OrderItemModelImplCopyWith<$Res> {
  __$$OrderItemModelImplCopyWithImpl(
      _$OrderItemModelImpl _value, $Res Function(_$OrderItemModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderId = null,
    Object? productId = null,
    Object? productName = null,
    Object? productSku = freezed,
    Object? quantity = null,
    Object? unitPrice = null,
    Object? taxRate = freezed,
    Object? taxAmount = freezed,
    Object? discountAmount = freezed,
    Object? lineTotal = null,
    Object? notes = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$OrderItemModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      productSku: freezed == productSku
          ? _value.productSku
          : productSku // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      unitPrice: null == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as String,
      taxRate: freezed == taxRate
          ? _value.taxRate
          : taxRate // ignore: cast_nullable_to_non_nullable
              as String?,
      taxAmount: freezed == taxAmount
          ? _value.taxAmount
          : taxAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      discountAmount: freezed == discountAmount
          ? _value.discountAmount
          : discountAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      lineTotal: null == lineTotal
          ? _value.lineTotal
          : lineTotal // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderItemModelImpl extends _OrderItemModel {
  const _$OrderItemModelImpl(
      {required this.id,
      @JsonKey(name: 'order_id') required this.orderId,
      @JsonKey(name: 'product_id') required this.productId,
      @JsonKey(name: 'product_name') required this.productName,
      @JsonKey(name: 'product_sku') this.productSku,
      required this.quantity,
      @JsonKey(name: 'unit_price') required this.unitPrice,
      @JsonKey(name: 'tax_rate') this.taxRate,
      @JsonKey(name: 'tax_amount') this.taxAmount,
      @JsonKey(name: 'discount_amount') this.discountAmount,
      @JsonKey(name: 'line_total') required this.lineTotal,
      this.notes,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt})
      : super._();

  factory _$OrderItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderItemModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'order_id')
  final String orderId;
  @override
  @JsonKey(name: 'product_id')
  final String productId;
  @override
  @JsonKey(name: 'product_name')
  final String productName;
  @override
  @JsonKey(name: 'product_sku')
  final String? productSku;
  @override
  final int quantity;
  @override
  @JsonKey(name: 'unit_price')
  final String unitPrice;
  @override
  @JsonKey(name: 'tax_rate')
  final String? taxRate;
  @override
  @JsonKey(name: 'tax_amount')
  final String? taxAmount;
  @override
  @JsonKey(name: 'discount_amount')
  final String? discountAmount;
  @override
  @JsonKey(name: 'line_total')
  final String lineTotal;
  @override
  final String? notes;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'OrderItemModel(id: $id, orderId: $orderId, productId: $productId, productName: $productName, productSku: $productSku, quantity: $quantity, unitPrice: $unitPrice, taxRate: $taxRate, taxAmount: $taxAmount, discountAmount: $discountAmount, lineTotal: $lineTotal, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderItemModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.productSku, productSku) ||
                other.productSku == productSku) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice) &&
            (identical(other.taxRate, taxRate) || other.taxRate == taxRate) &&
            (identical(other.taxAmount, taxAmount) ||
                other.taxAmount == taxAmount) &&
            (identical(other.discountAmount, discountAmount) ||
                other.discountAmount == discountAmount) &&
            (identical(other.lineTotal, lineTotal) ||
                other.lineTotal == lineTotal) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      orderId,
      productId,
      productName,
      productSku,
      quantity,
      unitPrice,
      taxRate,
      taxAmount,
      discountAmount,
      lineTotal,
      notes,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderItemModelImplCopyWith<_$OrderItemModelImpl> get copyWith =>
      __$$OrderItemModelImplCopyWithImpl<_$OrderItemModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderItemModelImplToJson(
      this,
    );
  }
}

abstract class _OrderItemModel extends OrderItemModel {
  const factory _OrderItemModel(
          {required final String id,
          @JsonKey(name: 'order_id') required final String orderId,
          @JsonKey(name: 'product_id') required final String productId,
          @JsonKey(name: 'product_name') required final String productName,
          @JsonKey(name: 'product_sku') final String? productSku,
          required final int quantity,
          @JsonKey(name: 'unit_price') required final String unitPrice,
          @JsonKey(name: 'tax_rate') final String? taxRate,
          @JsonKey(name: 'tax_amount') final String? taxAmount,
          @JsonKey(name: 'discount_amount') final String? discountAmount,
          @JsonKey(name: 'line_total') required final String lineTotal,
          final String? notes,
          @JsonKey(name: 'created_at') final DateTime? createdAt,
          @JsonKey(name: 'updated_at') final DateTime? updatedAt}) =
      _$OrderItemModelImpl;
  const _OrderItemModel._() : super._();

  factory _OrderItemModel.fromJson(Map<String, dynamic> json) =
      _$OrderItemModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'order_id')
  String get orderId;
  @override
  @JsonKey(name: 'product_id')
  String get productId;
  @override
  @JsonKey(name: 'product_name')
  String get productName;
  @override
  @JsonKey(name: 'product_sku')
  String? get productSku;
  @override
  int get quantity;
  @override
  @JsonKey(name: 'unit_price')
  String get unitPrice;
  @override
  @JsonKey(name: 'tax_rate')
  String? get taxRate;
  @override
  @JsonKey(name: 'tax_amount')
  String? get taxAmount;
  @override
  @JsonKey(name: 'discount_amount')
  String? get discountAmount;
  @override
  @JsonKey(name: 'line_total')
  String get lineTotal;
  @override
  String? get notes;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$OrderItemModelImplCopyWith<_$OrderItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaymentModel _$PaymentModelFromJson(Map<String, dynamic> json) {
  return _PaymentModel.fromJson(json);
}

/// @nodoc
mixin _$PaymentModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_id')
  String get orderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_date')
  DateTime get paymentDate => throw _privateConstructorUsedError;
  String get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_method')
  String get paymentMethod => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_id')
  String? get transactionId => throw _privateConstructorUsedError;
  String? get reference => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentModelCopyWith<PaymentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentModelCopyWith<$Res> {
  factory $PaymentModelCopyWith(
          PaymentModel value, $Res Function(PaymentModel) then) =
      _$PaymentModelCopyWithImpl<$Res, PaymentModel>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'order_id') String orderId,
      @JsonKey(name: 'payment_date') DateTime paymentDate,
      String amount,
      @JsonKey(name: 'payment_method') String paymentMethod,
      @JsonKey(name: 'transaction_id') String? transactionId,
      String? reference,
      String? notes,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class _$PaymentModelCopyWithImpl<$Res, $Val extends PaymentModel>
    implements $PaymentModelCopyWith<$Res> {
  _$PaymentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderId = null,
    Object? paymentDate = null,
    Object? amount = null,
    Object? paymentMethod = null,
    Object? transactionId = freezed,
    Object? reference = freezed,
    Object? notes = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      paymentDate: null == paymentDate
          ? _value.paymentDate
          : paymentDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String?,
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentModelImplCopyWith<$Res>
    implements $PaymentModelCopyWith<$Res> {
  factory _$$PaymentModelImplCopyWith(
          _$PaymentModelImpl value, $Res Function(_$PaymentModelImpl) then) =
      __$$PaymentModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'order_id') String orderId,
      @JsonKey(name: 'payment_date') DateTime paymentDate,
      String amount,
      @JsonKey(name: 'payment_method') String paymentMethod,
      @JsonKey(name: 'transaction_id') String? transactionId,
      String? reference,
      String? notes,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class __$$PaymentModelImplCopyWithImpl<$Res>
    extends _$PaymentModelCopyWithImpl<$Res, _$PaymentModelImpl>
    implements _$$PaymentModelImplCopyWith<$Res> {
  __$$PaymentModelImplCopyWithImpl(
      _$PaymentModelImpl _value, $Res Function(_$PaymentModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderId = null,
    Object? paymentDate = null,
    Object? amount = null,
    Object? paymentMethod = null,
    Object? transactionId = freezed,
    Object? reference = freezed,
    Object? notes = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$PaymentModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      paymentDate: null == paymentDate
          ? _value.paymentDate
          : paymentDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String?,
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentModelImpl extends _PaymentModel {
  const _$PaymentModelImpl(
      {required this.id,
      @JsonKey(name: 'order_id') required this.orderId,
      @JsonKey(name: 'payment_date') required this.paymentDate,
      required this.amount,
      @JsonKey(name: 'payment_method') required this.paymentMethod,
      @JsonKey(name: 'transaction_id') this.transactionId,
      this.reference,
      this.notes,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt})
      : super._();

  factory _$PaymentModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'order_id')
  final String orderId;
  @override
  @JsonKey(name: 'payment_date')
  final DateTime paymentDate;
  @override
  final String amount;
  @override
  @JsonKey(name: 'payment_method')
  final String paymentMethod;
  @override
  @JsonKey(name: 'transaction_id')
  final String? transactionId;
  @override
  final String? reference;
  @override
  final String? notes;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'PaymentModel(id: $id, orderId: $orderId, paymentDate: $paymentDate, amount: $amount, paymentMethod: $paymentMethod, transactionId: $transactionId, reference: $reference, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.paymentDate, paymentDate) ||
                other.paymentDate == paymentDate) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, orderId, paymentDate, amount,
      paymentMethod, transactionId, reference, notes, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentModelImplCopyWith<_$PaymentModelImpl> get copyWith =>
      __$$PaymentModelImplCopyWithImpl<_$PaymentModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentModelImplToJson(
      this,
    );
  }
}

abstract class _PaymentModel extends PaymentModel {
  const factory _PaymentModel(
          {required final String id,
          @JsonKey(name: 'order_id') required final String orderId,
          @JsonKey(name: 'payment_date') required final DateTime paymentDate,
          required final String amount,
          @JsonKey(name: 'payment_method') required final String paymentMethod,
          @JsonKey(name: 'transaction_id') final String? transactionId,
          final String? reference,
          final String? notes,
          @JsonKey(name: 'created_at') final DateTime? createdAt,
          @JsonKey(name: 'updated_at') final DateTime? updatedAt}) =
      _$PaymentModelImpl;
  const _PaymentModel._() : super._();

  factory _PaymentModel.fromJson(Map<String, dynamic> json) =
      _$PaymentModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'order_id')
  String get orderId;
  @override
  @JsonKey(name: 'payment_date')
  DateTime get paymentDate;
  @override
  String get amount;
  @override
  @JsonKey(name: 'payment_method')
  String get paymentMethod;
  @override
  @JsonKey(name: 'transaction_id')
  String? get transactionId;
  @override
  String? get reference;
  @override
  String? get notes;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$PaymentModelImplCopyWith<_$PaymentModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateOrderRequest _$CreateOrderRequestFromJson(Map<String, dynamic> json) {
  return _CreateOrderRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateOrderRequest {
  @JsonKey(name: 'customer_id')
  String get customerId => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_date')
  DateTime get orderDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_date')
  DateTime? get deliveryDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'shipping_address')
  String? get shippingAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'shipping_city')
  String? get shippingCity => throw _privateConstructorUsedError;
  @JsonKey(name: 'shipping_state')
  String? get shippingState => throw _privateConstructorUsedError;
  @JsonKey(name: 'shipping_postal_code')
  String? get shippingPostalCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'shipping_country')
  String? get shippingCountry => throw _privateConstructorUsedError;
  @JsonKey(name: 'billing_address')
  String? get billingAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'billing_city')
  String? get billingCity => throw _privateConstructorUsedError;
  @JsonKey(name: 'billing_state')
  String? get billingState => throw _privateConstructorUsedError;
  @JsonKey(name: 'billing_postal_code')
  String? get billingPostalCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'billing_country')
  String? get billingCountry => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount_amount')
  String? get discountAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'shipping_cost')
  String? get shippingCost => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_method')
  String? get paymentMethod => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(name: 'internal_notes')
  String? get internalNotes => throw _privateConstructorUsedError;
  List<CreateOrderItemRequest> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateOrderRequestCopyWith<CreateOrderRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateOrderRequestCopyWith<$Res> {
  factory $CreateOrderRequestCopyWith(
          CreateOrderRequest value, $Res Function(CreateOrderRequest) then) =
      _$CreateOrderRequestCopyWithImpl<$Res, CreateOrderRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'customer_id') String customerId,
      String status,
      @JsonKey(name: 'order_date') DateTime orderDate,
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
      List<CreateOrderItemRequest> items});
}

/// @nodoc
class _$CreateOrderRequestCopyWithImpl<$Res, $Val extends CreateOrderRequest>
    implements $CreateOrderRequestCopyWith<$Res> {
  _$CreateOrderRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerId = null,
    Object? status = null,
    Object? orderDate = null,
    Object? deliveryDate = freezed,
    Object? shippingAddress = freezed,
    Object? shippingCity = freezed,
    Object? shippingState = freezed,
    Object? shippingPostalCode = freezed,
    Object? shippingCountry = freezed,
    Object? billingAddress = freezed,
    Object? billingCity = freezed,
    Object? billingState = freezed,
    Object? billingPostalCode = freezed,
    Object? billingCountry = freezed,
    Object? discountAmount = freezed,
    Object? shippingCost = freezed,
    Object? paymentMethod = freezed,
    Object? notes = freezed,
    Object? internalNotes = freezed,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      orderDate: null == orderDate
          ? _value.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deliveryDate: freezed == deliveryDate
          ? _value.deliveryDate
          : deliveryDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      shippingAddress: freezed == shippingAddress
          ? _value.shippingAddress
          : shippingAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      shippingCity: freezed == shippingCity
          ? _value.shippingCity
          : shippingCity // ignore: cast_nullable_to_non_nullable
              as String?,
      shippingState: freezed == shippingState
          ? _value.shippingState
          : shippingState // ignore: cast_nullable_to_non_nullable
              as String?,
      shippingPostalCode: freezed == shippingPostalCode
          ? _value.shippingPostalCode
          : shippingPostalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      shippingCountry: freezed == shippingCountry
          ? _value.shippingCountry
          : shippingCountry // ignore: cast_nullable_to_non_nullable
              as String?,
      billingAddress: freezed == billingAddress
          ? _value.billingAddress
          : billingAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      billingCity: freezed == billingCity
          ? _value.billingCity
          : billingCity // ignore: cast_nullable_to_non_nullable
              as String?,
      billingState: freezed == billingState
          ? _value.billingState
          : billingState // ignore: cast_nullable_to_non_nullable
              as String?,
      billingPostalCode: freezed == billingPostalCode
          ? _value.billingPostalCode
          : billingPostalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      billingCountry: freezed == billingCountry
          ? _value.billingCountry
          : billingCountry // ignore: cast_nullable_to_non_nullable
              as String?,
      discountAmount: freezed == discountAmount
          ? _value.discountAmount
          : discountAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      shippingCost: freezed == shippingCost
          ? _value.shippingCost
          : shippingCost // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      internalNotes: freezed == internalNotes
          ? _value.internalNotes
          : internalNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CreateOrderItemRequest>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateOrderRequestImplCopyWith<$Res>
    implements $CreateOrderRequestCopyWith<$Res> {
  factory _$$CreateOrderRequestImplCopyWith(_$CreateOrderRequestImpl value,
          $Res Function(_$CreateOrderRequestImpl) then) =
      __$$CreateOrderRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'customer_id') String customerId,
      String status,
      @JsonKey(name: 'order_date') DateTime orderDate,
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
      List<CreateOrderItemRequest> items});
}

/// @nodoc
class __$$CreateOrderRequestImplCopyWithImpl<$Res>
    extends _$CreateOrderRequestCopyWithImpl<$Res, _$CreateOrderRequestImpl>
    implements _$$CreateOrderRequestImplCopyWith<$Res> {
  __$$CreateOrderRequestImplCopyWithImpl(_$CreateOrderRequestImpl _value,
      $Res Function(_$CreateOrderRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerId = null,
    Object? status = null,
    Object? orderDate = null,
    Object? deliveryDate = freezed,
    Object? shippingAddress = freezed,
    Object? shippingCity = freezed,
    Object? shippingState = freezed,
    Object? shippingPostalCode = freezed,
    Object? shippingCountry = freezed,
    Object? billingAddress = freezed,
    Object? billingCity = freezed,
    Object? billingState = freezed,
    Object? billingPostalCode = freezed,
    Object? billingCountry = freezed,
    Object? discountAmount = freezed,
    Object? shippingCost = freezed,
    Object? paymentMethod = freezed,
    Object? notes = freezed,
    Object? internalNotes = freezed,
    Object? items = null,
  }) {
    return _then(_$CreateOrderRequestImpl(
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      orderDate: null == orderDate
          ? _value.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deliveryDate: freezed == deliveryDate
          ? _value.deliveryDate
          : deliveryDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      shippingAddress: freezed == shippingAddress
          ? _value.shippingAddress
          : shippingAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      shippingCity: freezed == shippingCity
          ? _value.shippingCity
          : shippingCity // ignore: cast_nullable_to_non_nullable
              as String?,
      shippingState: freezed == shippingState
          ? _value.shippingState
          : shippingState // ignore: cast_nullable_to_non_nullable
              as String?,
      shippingPostalCode: freezed == shippingPostalCode
          ? _value.shippingPostalCode
          : shippingPostalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      shippingCountry: freezed == shippingCountry
          ? _value.shippingCountry
          : shippingCountry // ignore: cast_nullable_to_non_nullable
              as String?,
      billingAddress: freezed == billingAddress
          ? _value.billingAddress
          : billingAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      billingCity: freezed == billingCity
          ? _value.billingCity
          : billingCity // ignore: cast_nullable_to_non_nullable
              as String?,
      billingState: freezed == billingState
          ? _value.billingState
          : billingState // ignore: cast_nullable_to_non_nullable
              as String?,
      billingPostalCode: freezed == billingPostalCode
          ? _value.billingPostalCode
          : billingPostalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      billingCountry: freezed == billingCountry
          ? _value.billingCountry
          : billingCountry // ignore: cast_nullable_to_non_nullable
              as String?,
      discountAmount: freezed == discountAmount
          ? _value.discountAmount
          : discountAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      shippingCost: freezed == shippingCost
          ? _value.shippingCost
          : shippingCost // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      internalNotes: freezed == internalNotes
          ? _value.internalNotes
          : internalNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CreateOrderItemRequest>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateOrderRequestImpl implements _CreateOrderRequest {
  const _$CreateOrderRequestImpl(
      {@JsonKey(name: 'customer_id') required this.customerId,
      required this.status,
      @JsonKey(name: 'order_date') required this.orderDate,
      @JsonKey(name: 'delivery_date') this.deliveryDate,
      @JsonKey(name: 'shipping_address') this.shippingAddress,
      @JsonKey(name: 'shipping_city') this.shippingCity,
      @JsonKey(name: 'shipping_state') this.shippingState,
      @JsonKey(name: 'shipping_postal_code') this.shippingPostalCode,
      @JsonKey(name: 'shipping_country') this.shippingCountry,
      @JsonKey(name: 'billing_address') this.billingAddress,
      @JsonKey(name: 'billing_city') this.billingCity,
      @JsonKey(name: 'billing_state') this.billingState,
      @JsonKey(name: 'billing_postal_code') this.billingPostalCode,
      @JsonKey(name: 'billing_country') this.billingCountry,
      @JsonKey(name: 'discount_amount') this.discountAmount,
      @JsonKey(name: 'shipping_cost') this.shippingCost,
      @JsonKey(name: 'payment_method') this.paymentMethod,
      this.notes,
      @JsonKey(name: 'internal_notes') this.internalNotes,
      required final List<CreateOrderItemRequest> items})
      : _items = items;

  factory _$CreateOrderRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateOrderRequestImplFromJson(json);

  @override
  @JsonKey(name: 'customer_id')
  final String customerId;
  @override
  final String status;
  @override
  @JsonKey(name: 'order_date')
  final DateTime orderDate;
  @override
  @JsonKey(name: 'delivery_date')
  final DateTime? deliveryDate;
  @override
  @JsonKey(name: 'shipping_address')
  final String? shippingAddress;
  @override
  @JsonKey(name: 'shipping_city')
  final String? shippingCity;
  @override
  @JsonKey(name: 'shipping_state')
  final String? shippingState;
  @override
  @JsonKey(name: 'shipping_postal_code')
  final String? shippingPostalCode;
  @override
  @JsonKey(name: 'shipping_country')
  final String? shippingCountry;
  @override
  @JsonKey(name: 'billing_address')
  final String? billingAddress;
  @override
  @JsonKey(name: 'billing_city')
  final String? billingCity;
  @override
  @JsonKey(name: 'billing_state')
  final String? billingState;
  @override
  @JsonKey(name: 'billing_postal_code')
  final String? billingPostalCode;
  @override
  @JsonKey(name: 'billing_country')
  final String? billingCountry;
  @override
  @JsonKey(name: 'discount_amount')
  final String? discountAmount;
  @override
  @JsonKey(name: 'shipping_cost')
  final String? shippingCost;
  @override
  @JsonKey(name: 'payment_method')
  final String? paymentMethod;
  @override
  final String? notes;
  @override
  @JsonKey(name: 'internal_notes')
  final String? internalNotes;
  final List<CreateOrderItemRequest> _items;
  @override
  List<CreateOrderItemRequest> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'CreateOrderRequest(customerId: $customerId, status: $status, orderDate: $orderDate, deliveryDate: $deliveryDate, shippingAddress: $shippingAddress, shippingCity: $shippingCity, shippingState: $shippingState, shippingPostalCode: $shippingPostalCode, shippingCountry: $shippingCountry, billingAddress: $billingAddress, billingCity: $billingCity, billingState: $billingState, billingPostalCode: $billingPostalCode, billingCountry: $billingCountry, discountAmount: $discountAmount, shippingCost: $shippingCost, paymentMethod: $paymentMethod, notes: $notes, internalNotes: $internalNotes, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateOrderRequestImpl &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.orderDate, orderDate) ||
                other.orderDate == orderDate) &&
            (identical(other.deliveryDate, deliveryDate) ||
                other.deliveryDate == deliveryDate) &&
            (identical(other.shippingAddress, shippingAddress) ||
                other.shippingAddress == shippingAddress) &&
            (identical(other.shippingCity, shippingCity) ||
                other.shippingCity == shippingCity) &&
            (identical(other.shippingState, shippingState) ||
                other.shippingState == shippingState) &&
            (identical(other.shippingPostalCode, shippingPostalCode) ||
                other.shippingPostalCode == shippingPostalCode) &&
            (identical(other.shippingCountry, shippingCountry) ||
                other.shippingCountry == shippingCountry) &&
            (identical(other.billingAddress, billingAddress) ||
                other.billingAddress == billingAddress) &&
            (identical(other.billingCity, billingCity) ||
                other.billingCity == billingCity) &&
            (identical(other.billingState, billingState) ||
                other.billingState == billingState) &&
            (identical(other.billingPostalCode, billingPostalCode) ||
                other.billingPostalCode == billingPostalCode) &&
            (identical(other.billingCountry, billingCountry) ||
                other.billingCountry == billingCountry) &&
            (identical(other.discountAmount, discountAmount) ||
                other.discountAmount == discountAmount) &&
            (identical(other.shippingCost, shippingCost) ||
                other.shippingCost == shippingCost) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.internalNotes, internalNotes) ||
                other.internalNotes == internalNotes) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        customerId,
        status,
        orderDate,
        deliveryDate,
        shippingAddress,
        shippingCity,
        shippingState,
        shippingPostalCode,
        shippingCountry,
        billingAddress,
        billingCity,
        billingState,
        billingPostalCode,
        billingCountry,
        discountAmount,
        shippingCost,
        paymentMethod,
        notes,
        internalNotes,
        const DeepCollectionEquality().hash(_items)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateOrderRequestImplCopyWith<_$CreateOrderRequestImpl> get copyWith =>
      __$$CreateOrderRequestImplCopyWithImpl<_$CreateOrderRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateOrderRequestImplToJson(
      this,
    );
  }
}

abstract class _CreateOrderRequest implements CreateOrderRequest {
  const factory _CreateOrderRequest(
      {@JsonKey(name: 'customer_id') required final String customerId,
      required final String status,
      @JsonKey(name: 'order_date') required final DateTime orderDate,
      @JsonKey(name: 'delivery_date') final DateTime? deliveryDate,
      @JsonKey(name: 'shipping_address') final String? shippingAddress,
      @JsonKey(name: 'shipping_city') final String? shippingCity,
      @JsonKey(name: 'shipping_state') final String? shippingState,
      @JsonKey(name: 'shipping_postal_code') final String? shippingPostalCode,
      @JsonKey(name: 'shipping_country') final String? shippingCountry,
      @JsonKey(name: 'billing_address') final String? billingAddress,
      @JsonKey(name: 'billing_city') final String? billingCity,
      @JsonKey(name: 'billing_state') final String? billingState,
      @JsonKey(name: 'billing_postal_code') final String? billingPostalCode,
      @JsonKey(name: 'billing_country') final String? billingCountry,
      @JsonKey(name: 'discount_amount') final String? discountAmount,
      @JsonKey(name: 'shipping_cost') final String? shippingCost,
      @JsonKey(name: 'payment_method') final String? paymentMethod,
      final String? notes,
      @JsonKey(name: 'internal_notes') final String? internalNotes,
      required final List<CreateOrderItemRequest>
          items}) = _$CreateOrderRequestImpl;

  factory _CreateOrderRequest.fromJson(Map<String, dynamic> json) =
      _$CreateOrderRequestImpl.fromJson;

  @override
  @JsonKey(name: 'customer_id')
  String get customerId;
  @override
  String get status;
  @override
  @JsonKey(name: 'order_date')
  DateTime get orderDate;
  @override
  @JsonKey(name: 'delivery_date')
  DateTime? get deliveryDate;
  @override
  @JsonKey(name: 'shipping_address')
  String? get shippingAddress;
  @override
  @JsonKey(name: 'shipping_city')
  String? get shippingCity;
  @override
  @JsonKey(name: 'shipping_state')
  String? get shippingState;
  @override
  @JsonKey(name: 'shipping_postal_code')
  String? get shippingPostalCode;
  @override
  @JsonKey(name: 'shipping_country')
  String? get shippingCountry;
  @override
  @JsonKey(name: 'billing_address')
  String? get billingAddress;
  @override
  @JsonKey(name: 'billing_city')
  String? get billingCity;
  @override
  @JsonKey(name: 'billing_state')
  String? get billingState;
  @override
  @JsonKey(name: 'billing_postal_code')
  String? get billingPostalCode;
  @override
  @JsonKey(name: 'billing_country')
  String? get billingCountry;
  @override
  @JsonKey(name: 'discount_amount')
  String? get discountAmount;
  @override
  @JsonKey(name: 'shipping_cost')
  String? get shippingCost;
  @override
  @JsonKey(name: 'payment_method')
  String? get paymentMethod;
  @override
  String? get notes;
  @override
  @JsonKey(name: 'internal_notes')
  String? get internalNotes;
  @override
  List<CreateOrderItemRequest> get items;
  @override
  @JsonKey(ignore: true)
  _$$CreateOrderRequestImplCopyWith<_$CreateOrderRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateOrderItemRequest _$CreateOrderItemRequestFromJson(
    Map<String, dynamic> json) {
  return _CreateOrderItemRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateOrderItemRequest {
  @JsonKey(name: 'product_id')
  String get productId => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'unit_price')
  String get unitPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount_amount')
  String? get discountAmount => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateOrderItemRequestCopyWith<CreateOrderItemRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateOrderItemRequestCopyWith<$Res> {
  factory $CreateOrderItemRequestCopyWith(CreateOrderItemRequest value,
          $Res Function(CreateOrderItemRequest) then) =
      _$CreateOrderItemRequestCopyWithImpl<$Res, CreateOrderItemRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'product_id') String productId,
      int quantity,
      @JsonKey(name: 'unit_price') String unitPrice,
      @JsonKey(name: 'discount_amount') String? discountAmount,
      String? notes});
}

/// @nodoc
class _$CreateOrderItemRequestCopyWithImpl<$Res,
        $Val extends CreateOrderItemRequest>
    implements $CreateOrderItemRequestCopyWith<$Res> {
  _$CreateOrderItemRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? quantity = null,
    Object? unitPrice = null,
    Object? discountAmount = freezed,
    Object? notes = freezed,
  }) {
    return _then(_value.copyWith(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      unitPrice: null == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as String,
      discountAmount: freezed == discountAmount
          ? _value.discountAmount
          : discountAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateOrderItemRequestImplCopyWith<$Res>
    implements $CreateOrderItemRequestCopyWith<$Res> {
  factory _$$CreateOrderItemRequestImplCopyWith(
          _$CreateOrderItemRequestImpl value,
          $Res Function(_$CreateOrderItemRequestImpl) then) =
      __$$CreateOrderItemRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'product_id') String productId,
      int quantity,
      @JsonKey(name: 'unit_price') String unitPrice,
      @JsonKey(name: 'discount_amount') String? discountAmount,
      String? notes});
}

/// @nodoc
class __$$CreateOrderItemRequestImplCopyWithImpl<$Res>
    extends _$CreateOrderItemRequestCopyWithImpl<$Res,
        _$CreateOrderItemRequestImpl>
    implements _$$CreateOrderItemRequestImplCopyWith<$Res> {
  __$$CreateOrderItemRequestImplCopyWithImpl(
      _$CreateOrderItemRequestImpl _value,
      $Res Function(_$CreateOrderItemRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? quantity = null,
    Object? unitPrice = null,
    Object? discountAmount = freezed,
    Object? notes = freezed,
  }) {
    return _then(_$CreateOrderItemRequestImpl(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      unitPrice: null == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as String,
      discountAmount: freezed == discountAmount
          ? _value.discountAmount
          : discountAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateOrderItemRequestImpl implements _CreateOrderItemRequest {
  const _$CreateOrderItemRequestImpl(
      {@JsonKey(name: 'product_id') required this.productId,
      required this.quantity,
      @JsonKey(name: 'unit_price') required this.unitPrice,
      @JsonKey(name: 'discount_amount') this.discountAmount,
      this.notes});

  factory _$CreateOrderItemRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateOrderItemRequestImplFromJson(json);

  @override
  @JsonKey(name: 'product_id')
  final String productId;
  @override
  final int quantity;
  @override
  @JsonKey(name: 'unit_price')
  final String unitPrice;
  @override
  @JsonKey(name: 'discount_amount')
  final String? discountAmount;
  @override
  final String? notes;

  @override
  String toString() {
    return 'CreateOrderItemRequest(productId: $productId, quantity: $quantity, unitPrice: $unitPrice, discountAmount: $discountAmount, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateOrderItemRequestImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice) &&
            (identical(other.discountAmount, discountAmount) ||
                other.discountAmount == discountAmount) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, productId, quantity, unitPrice, discountAmount, notes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateOrderItemRequestImplCopyWith<_$CreateOrderItemRequestImpl>
      get copyWith => __$$CreateOrderItemRequestImplCopyWithImpl<
          _$CreateOrderItemRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateOrderItemRequestImplToJson(
      this,
    );
  }
}

abstract class _CreateOrderItemRequest implements CreateOrderItemRequest {
  const factory _CreateOrderItemRequest(
      {@JsonKey(name: 'product_id') required final String productId,
      required final int quantity,
      @JsonKey(name: 'unit_price') required final String unitPrice,
      @JsonKey(name: 'discount_amount') final String? discountAmount,
      final String? notes}) = _$CreateOrderItemRequestImpl;

  factory _CreateOrderItemRequest.fromJson(Map<String, dynamic> json) =
      _$CreateOrderItemRequestImpl.fromJson;

  @override
  @JsonKey(name: 'product_id')
  String get productId;
  @override
  int get quantity;
  @override
  @JsonKey(name: 'unit_price')
  String get unitPrice;
  @override
  @JsonKey(name: 'discount_amount')
  String? get discountAmount;
  @override
  String? get notes;
  @override
  @JsonKey(ignore: true)
  _$$CreateOrderItemRequestImplCopyWith<_$CreateOrderItemRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

UpdateOrderRequest _$UpdateOrderRequestFromJson(Map<String, dynamic> json) {
  return _UpdateOrderRequest.fromJson(json);
}

/// @nodoc
mixin _$UpdateOrderRequest {
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_date')
  DateTime? get deliveryDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'shipping_address')
  String? get shippingAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'shipping_city')
  String? get shippingCity => throw _privateConstructorUsedError;
  @JsonKey(name: 'shipping_state')
  String? get shippingState => throw _privateConstructorUsedError;
  @JsonKey(name: 'shipping_postal_code')
  String? get shippingPostalCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'shipping_country')
  String? get shippingCountry => throw _privateConstructorUsedError;
  @JsonKey(name: 'billing_address')
  String? get billingAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'billing_city')
  String? get billingCity => throw _privateConstructorUsedError;
  @JsonKey(name: 'billing_state')
  String? get billingState => throw _privateConstructorUsedError;
  @JsonKey(name: 'billing_postal_code')
  String? get billingPostalCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'billing_country')
  String? get billingCountry => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount_amount')
  String? get discountAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'shipping_cost')
  String? get shippingCost => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_method')
  String? get paymentMethod => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(name: 'internal_notes')
  String? get internalNotes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateOrderRequestCopyWith<UpdateOrderRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateOrderRequestCopyWith<$Res> {
  factory $UpdateOrderRequestCopyWith(
          UpdateOrderRequest value, $Res Function(UpdateOrderRequest) then) =
      _$UpdateOrderRequestCopyWithImpl<$Res, UpdateOrderRequest>;
  @useResult
  $Res call(
      {String? status,
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
      @JsonKey(name: 'internal_notes') String? internalNotes});
}

/// @nodoc
class _$UpdateOrderRequestCopyWithImpl<$Res, $Val extends UpdateOrderRequest>
    implements $UpdateOrderRequestCopyWith<$Res> {
  _$UpdateOrderRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? deliveryDate = freezed,
    Object? shippingAddress = freezed,
    Object? shippingCity = freezed,
    Object? shippingState = freezed,
    Object? shippingPostalCode = freezed,
    Object? shippingCountry = freezed,
    Object? billingAddress = freezed,
    Object? billingCity = freezed,
    Object? billingState = freezed,
    Object? billingPostalCode = freezed,
    Object? billingCountry = freezed,
    Object? discountAmount = freezed,
    Object? shippingCost = freezed,
    Object? paymentMethod = freezed,
    Object? notes = freezed,
    Object? internalNotes = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryDate: freezed == deliveryDate
          ? _value.deliveryDate
          : deliveryDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      shippingAddress: freezed == shippingAddress
          ? _value.shippingAddress
          : shippingAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      shippingCity: freezed == shippingCity
          ? _value.shippingCity
          : shippingCity // ignore: cast_nullable_to_non_nullable
              as String?,
      shippingState: freezed == shippingState
          ? _value.shippingState
          : shippingState // ignore: cast_nullable_to_non_nullable
              as String?,
      shippingPostalCode: freezed == shippingPostalCode
          ? _value.shippingPostalCode
          : shippingPostalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      shippingCountry: freezed == shippingCountry
          ? _value.shippingCountry
          : shippingCountry // ignore: cast_nullable_to_non_nullable
              as String?,
      billingAddress: freezed == billingAddress
          ? _value.billingAddress
          : billingAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      billingCity: freezed == billingCity
          ? _value.billingCity
          : billingCity // ignore: cast_nullable_to_non_nullable
              as String?,
      billingState: freezed == billingState
          ? _value.billingState
          : billingState // ignore: cast_nullable_to_non_nullable
              as String?,
      billingPostalCode: freezed == billingPostalCode
          ? _value.billingPostalCode
          : billingPostalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      billingCountry: freezed == billingCountry
          ? _value.billingCountry
          : billingCountry // ignore: cast_nullable_to_non_nullable
              as String?,
      discountAmount: freezed == discountAmount
          ? _value.discountAmount
          : discountAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      shippingCost: freezed == shippingCost
          ? _value.shippingCost
          : shippingCost // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      internalNotes: freezed == internalNotes
          ? _value.internalNotes
          : internalNotes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateOrderRequestImplCopyWith<$Res>
    implements $UpdateOrderRequestCopyWith<$Res> {
  factory _$$UpdateOrderRequestImplCopyWith(_$UpdateOrderRequestImpl value,
          $Res Function(_$UpdateOrderRequestImpl) then) =
      __$$UpdateOrderRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? status,
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
      @JsonKey(name: 'internal_notes') String? internalNotes});
}

/// @nodoc
class __$$UpdateOrderRequestImplCopyWithImpl<$Res>
    extends _$UpdateOrderRequestCopyWithImpl<$Res, _$UpdateOrderRequestImpl>
    implements _$$UpdateOrderRequestImplCopyWith<$Res> {
  __$$UpdateOrderRequestImplCopyWithImpl(_$UpdateOrderRequestImpl _value,
      $Res Function(_$UpdateOrderRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? deliveryDate = freezed,
    Object? shippingAddress = freezed,
    Object? shippingCity = freezed,
    Object? shippingState = freezed,
    Object? shippingPostalCode = freezed,
    Object? shippingCountry = freezed,
    Object? billingAddress = freezed,
    Object? billingCity = freezed,
    Object? billingState = freezed,
    Object? billingPostalCode = freezed,
    Object? billingCountry = freezed,
    Object? discountAmount = freezed,
    Object? shippingCost = freezed,
    Object? paymentMethod = freezed,
    Object? notes = freezed,
    Object? internalNotes = freezed,
  }) {
    return _then(_$UpdateOrderRequestImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryDate: freezed == deliveryDate
          ? _value.deliveryDate
          : deliveryDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      shippingAddress: freezed == shippingAddress
          ? _value.shippingAddress
          : shippingAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      shippingCity: freezed == shippingCity
          ? _value.shippingCity
          : shippingCity // ignore: cast_nullable_to_non_nullable
              as String?,
      shippingState: freezed == shippingState
          ? _value.shippingState
          : shippingState // ignore: cast_nullable_to_non_nullable
              as String?,
      shippingPostalCode: freezed == shippingPostalCode
          ? _value.shippingPostalCode
          : shippingPostalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      shippingCountry: freezed == shippingCountry
          ? _value.shippingCountry
          : shippingCountry // ignore: cast_nullable_to_non_nullable
              as String?,
      billingAddress: freezed == billingAddress
          ? _value.billingAddress
          : billingAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      billingCity: freezed == billingCity
          ? _value.billingCity
          : billingCity // ignore: cast_nullable_to_non_nullable
              as String?,
      billingState: freezed == billingState
          ? _value.billingState
          : billingState // ignore: cast_nullable_to_non_nullable
              as String?,
      billingPostalCode: freezed == billingPostalCode
          ? _value.billingPostalCode
          : billingPostalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      billingCountry: freezed == billingCountry
          ? _value.billingCountry
          : billingCountry // ignore: cast_nullable_to_non_nullable
              as String?,
      discountAmount: freezed == discountAmount
          ? _value.discountAmount
          : discountAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      shippingCost: freezed == shippingCost
          ? _value.shippingCost
          : shippingCost // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      internalNotes: freezed == internalNotes
          ? _value.internalNotes
          : internalNotes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateOrderRequestImpl implements _UpdateOrderRequest {
  const _$UpdateOrderRequestImpl(
      {this.status,
      @JsonKey(name: 'delivery_date') this.deliveryDate,
      @JsonKey(name: 'shipping_address') this.shippingAddress,
      @JsonKey(name: 'shipping_city') this.shippingCity,
      @JsonKey(name: 'shipping_state') this.shippingState,
      @JsonKey(name: 'shipping_postal_code') this.shippingPostalCode,
      @JsonKey(name: 'shipping_country') this.shippingCountry,
      @JsonKey(name: 'billing_address') this.billingAddress,
      @JsonKey(name: 'billing_city') this.billingCity,
      @JsonKey(name: 'billing_state') this.billingState,
      @JsonKey(name: 'billing_postal_code') this.billingPostalCode,
      @JsonKey(name: 'billing_country') this.billingCountry,
      @JsonKey(name: 'discount_amount') this.discountAmount,
      @JsonKey(name: 'shipping_cost') this.shippingCost,
      @JsonKey(name: 'payment_method') this.paymentMethod,
      this.notes,
      @JsonKey(name: 'internal_notes') this.internalNotes});

  factory _$UpdateOrderRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateOrderRequestImplFromJson(json);

  @override
  final String? status;
  @override
  @JsonKey(name: 'delivery_date')
  final DateTime? deliveryDate;
  @override
  @JsonKey(name: 'shipping_address')
  final String? shippingAddress;
  @override
  @JsonKey(name: 'shipping_city')
  final String? shippingCity;
  @override
  @JsonKey(name: 'shipping_state')
  final String? shippingState;
  @override
  @JsonKey(name: 'shipping_postal_code')
  final String? shippingPostalCode;
  @override
  @JsonKey(name: 'shipping_country')
  final String? shippingCountry;
  @override
  @JsonKey(name: 'billing_address')
  final String? billingAddress;
  @override
  @JsonKey(name: 'billing_city')
  final String? billingCity;
  @override
  @JsonKey(name: 'billing_state')
  final String? billingState;
  @override
  @JsonKey(name: 'billing_postal_code')
  final String? billingPostalCode;
  @override
  @JsonKey(name: 'billing_country')
  final String? billingCountry;
  @override
  @JsonKey(name: 'discount_amount')
  final String? discountAmount;
  @override
  @JsonKey(name: 'shipping_cost')
  final String? shippingCost;
  @override
  @JsonKey(name: 'payment_method')
  final String? paymentMethod;
  @override
  final String? notes;
  @override
  @JsonKey(name: 'internal_notes')
  final String? internalNotes;

  @override
  String toString() {
    return 'UpdateOrderRequest(status: $status, deliveryDate: $deliveryDate, shippingAddress: $shippingAddress, shippingCity: $shippingCity, shippingState: $shippingState, shippingPostalCode: $shippingPostalCode, shippingCountry: $shippingCountry, billingAddress: $billingAddress, billingCity: $billingCity, billingState: $billingState, billingPostalCode: $billingPostalCode, billingCountry: $billingCountry, discountAmount: $discountAmount, shippingCost: $shippingCost, paymentMethod: $paymentMethod, notes: $notes, internalNotes: $internalNotes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateOrderRequestImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.deliveryDate, deliveryDate) ||
                other.deliveryDate == deliveryDate) &&
            (identical(other.shippingAddress, shippingAddress) ||
                other.shippingAddress == shippingAddress) &&
            (identical(other.shippingCity, shippingCity) ||
                other.shippingCity == shippingCity) &&
            (identical(other.shippingState, shippingState) ||
                other.shippingState == shippingState) &&
            (identical(other.shippingPostalCode, shippingPostalCode) ||
                other.shippingPostalCode == shippingPostalCode) &&
            (identical(other.shippingCountry, shippingCountry) ||
                other.shippingCountry == shippingCountry) &&
            (identical(other.billingAddress, billingAddress) ||
                other.billingAddress == billingAddress) &&
            (identical(other.billingCity, billingCity) ||
                other.billingCity == billingCity) &&
            (identical(other.billingState, billingState) ||
                other.billingState == billingState) &&
            (identical(other.billingPostalCode, billingPostalCode) ||
                other.billingPostalCode == billingPostalCode) &&
            (identical(other.billingCountry, billingCountry) ||
                other.billingCountry == billingCountry) &&
            (identical(other.discountAmount, discountAmount) ||
                other.discountAmount == discountAmount) &&
            (identical(other.shippingCost, shippingCost) ||
                other.shippingCost == shippingCost) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.internalNotes, internalNotes) ||
                other.internalNotes == internalNotes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      deliveryDate,
      shippingAddress,
      shippingCity,
      shippingState,
      shippingPostalCode,
      shippingCountry,
      billingAddress,
      billingCity,
      billingState,
      billingPostalCode,
      billingCountry,
      discountAmount,
      shippingCost,
      paymentMethod,
      notes,
      internalNotes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateOrderRequestImplCopyWith<_$UpdateOrderRequestImpl> get copyWith =>
      __$$UpdateOrderRequestImplCopyWithImpl<_$UpdateOrderRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateOrderRequestImplToJson(
      this,
    );
  }
}

abstract class _UpdateOrderRequest implements UpdateOrderRequest {
  const factory _UpdateOrderRequest(
      {final String? status,
      @JsonKey(name: 'delivery_date') final DateTime? deliveryDate,
      @JsonKey(name: 'shipping_address') final String? shippingAddress,
      @JsonKey(name: 'shipping_city') final String? shippingCity,
      @JsonKey(name: 'shipping_state') final String? shippingState,
      @JsonKey(name: 'shipping_postal_code') final String? shippingPostalCode,
      @JsonKey(name: 'shipping_country') final String? shippingCountry,
      @JsonKey(name: 'billing_address') final String? billingAddress,
      @JsonKey(name: 'billing_city') final String? billingCity,
      @JsonKey(name: 'billing_state') final String? billingState,
      @JsonKey(name: 'billing_postal_code') final String? billingPostalCode,
      @JsonKey(name: 'billing_country') final String? billingCountry,
      @JsonKey(name: 'discount_amount') final String? discountAmount,
      @JsonKey(name: 'shipping_cost') final String? shippingCost,
      @JsonKey(name: 'payment_method') final String? paymentMethod,
      final String? notes,
      @JsonKey(name: 'internal_notes')
      final String? internalNotes}) = _$UpdateOrderRequestImpl;

  factory _UpdateOrderRequest.fromJson(Map<String, dynamic> json) =
      _$UpdateOrderRequestImpl.fromJson;

  @override
  String? get status;
  @override
  @JsonKey(name: 'delivery_date')
  DateTime? get deliveryDate;
  @override
  @JsonKey(name: 'shipping_address')
  String? get shippingAddress;
  @override
  @JsonKey(name: 'shipping_city')
  String? get shippingCity;
  @override
  @JsonKey(name: 'shipping_state')
  String? get shippingState;
  @override
  @JsonKey(name: 'shipping_postal_code')
  String? get shippingPostalCode;
  @override
  @JsonKey(name: 'shipping_country')
  String? get shippingCountry;
  @override
  @JsonKey(name: 'billing_address')
  String? get billingAddress;
  @override
  @JsonKey(name: 'billing_city')
  String? get billingCity;
  @override
  @JsonKey(name: 'billing_state')
  String? get billingState;
  @override
  @JsonKey(name: 'billing_postal_code')
  String? get billingPostalCode;
  @override
  @JsonKey(name: 'billing_country')
  String? get billingCountry;
  @override
  @JsonKey(name: 'discount_amount')
  String? get discountAmount;
  @override
  @JsonKey(name: 'shipping_cost')
  String? get shippingCost;
  @override
  @JsonKey(name: 'payment_method')
  String? get paymentMethod;
  @override
  String? get notes;
  @override
  @JsonKey(name: 'internal_notes')
  String? get internalNotes;
  @override
  @JsonKey(ignore: true)
  _$$UpdateOrderRequestImplCopyWith<_$UpdateOrderRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RecordPaymentRequest _$RecordPaymentRequestFromJson(Map<String, dynamic> json) {
  return _RecordPaymentRequest.fromJson(json);
}

/// @nodoc
mixin _$RecordPaymentRequest {
  String get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_method')
  String get paymentMethod => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_date')
  DateTime get paymentDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_id')
  String? get transactionId => throw _privateConstructorUsedError;
  String? get reference => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecordPaymentRequestCopyWith<RecordPaymentRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecordPaymentRequestCopyWith<$Res> {
  factory $RecordPaymentRequestCopyWith(RecordPaymentRequest value,
          $Res Function(RecordPaymentRequest) then) =
      _$RecordPaymentRequestCopyWithImpl<$Res, RecordPaymentRequest>;
  @useResult
  $Res call(
      {String amount,
      @JsonKey(name: 'payment_method') String paymentMethod,
      @JsonKey(name: 'payment_date') DateTime paymentDate,
      @JsonKey(name: 'transaction_id') String? transactionId,
      String? reference,
      String? notes});
}

/// @nodoc
class _$RecordPaymentRequestCopyWithImpl<$Res,
        $Val extends RecordPaymentRequest>
    implements $RecordPaymentRequestCopyWith<$Res> {
  _$RecordPaymentRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? paymentMethod = null,
    Object? paymentDate = null,
    Object? transactionId = freezed,
    Object? reference = freezed,
    Object? notes = freezed,
  }) {
    return _then(_value.copyWith(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      paymentDate: null == paymentDate
          ? _value.paymentDate
          : paymentDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String?,
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecordPaymentRequestImplCopyWith<$Res>
    implements $RecordPaymentRequestCopyWith<$Res> {
  factory _$$RecordPaymentRequestImplCopyWith(_$RecordPaymentRequestImpl value,
          $Res Function(_$RecordPaymentRequestImpl) then) =
      __$$RecordPaymentRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String amount,
      @JsonKey(name: 'payment_method') String paymentMethod,
      @JsonKey(name: 'payment_date') DateTime paymentDate,
      @JsonKey(name: 'transaction_id') String? transactionId,
      String? reference,
      String? notes});
}

/// @nodoc
class __$$RecordPaymentRequestImplCopyWithImpl<$Res>
    extends _$RecordPaymentRequestCopyWithImpl<$Res, _$RecordPaymentRequestImpl>
    implements _$$RecordPaymentRequestImplCopyWith<$Res> {
  __$$RecordPaymentRequestImplCopyWithImpl(_$RecordPaymentRequestImpl _value,
      $Res Function(_$RecordPaymentRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? paymentMethod = null,
    Object? paymentDate = null,
    Object? transactionId = freezed,
    Object? reference = freezed,
    Object? notes = freezed,
  }) {
    return _then(_$RecordPaymentRequestImpl(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      paymentDate: null == paymentDate
          ? _value.paymentDate
          : paymentDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String?,
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecordPaymentRequestImpl implements _RecordPaymentRequest {
  const _$RecordPaymentRequestImpl(
      {required this.amount,
      @JsonKey(name: 'payment_method') required this.paymentMethod,
      @JsonKey(name: 'payment_date') required this.paymentDate,
      @JsonKey(name: 'transaction_id') this.transactionId,
      this.reference,
      this.notes});

  factory _$RecordPaymentRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecordPaymentRequestImplFromJson(json);

  @override
  final String amount;
  @override
  @JsonKey(name: 'payment_method')
  final String paymentMethod;
  @override
  @JsonKey(name: 'payment_date')
  final DateTime paymentDate;
  @override
  @JsonKey(name: 'transaction_id')
  final String? transactionId;
  @override
  final String? reference;
  @override
  final String? notes;

  @override
  String toString() {
    return 'RecordPaymentRequest(amount: $amount, paymentMethod: $paymentMethod, paymentDate: $paymentDate, transactionId: $transactionId, reference: $reference, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecordPaymentRequestImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.paymentDate, paymentDate) ||
                other.paymentDate == paymentDate) &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, amount, paymentMethod,
      paymentDate, transactionId, reference, notes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecordPaymentRequestImplCopyWith<_$RecordPaymentRequestImpl>
      get copyWith =>
          __$$RecordPaymentRequestImplCopyWithImpl<_$RecordPaymentRequestImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecordPaymentRequestImplToJson(
      this,
    );
  }
}

abstract class _RecordPaymentRequest implements RecordPaymentRequest {
  const factory _RecordPaymentRequest(
      {required final String amount,
      @JsonKey(name: 'payment_method') required final String paymentMethod,
      @JsonKey(name: 'payment_date') required final DateTime paymentDate,
      @JsonKey(name: 'transaction_id') final String? transactionId,
      final String? reference,
      final String? notes}) = _$RecordPaymentRequestImpl;

  factory _RecordPaymentRequest.fromJson(Map<String, dynamic> json) =
      _$RecordPaymentRequestImpl.fromJson;

  @override
  String get amount;
  @override
  @JsonKey(name: 'payment_method')
  String get paymentMethod;
  @override
  @JsonKey(name: 'payment_date')
  DateTime get paymentDate;
  @override
  @JsonKey(name: 'transaction_id')
  String? get transactionId;
  @override
  String? get reference;
  @override
  String? get notes;
  @override
  @JsonKey(ignore: true)
  _$$RecordPaymentRequestImplCopyWith<_$RecordPaymentRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

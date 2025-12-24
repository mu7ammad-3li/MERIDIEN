import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../models/order_model.dart';

part 'order_repository.g.dart';

@RestApi()
abstract class OrderRepository {
  factory OrderRepository(Dio dio, {String baseUrl}) = _OrderRepository;

  @GET('/orders')
  Future<List<OrderModel>> getOrders({
    @Query('page') int? page,
    @Query('per_page') int? perPage,
    @Query('customer_id') String? customerId,
    @Query('status') String? status,
    @Query('payment_status') String? paymentStatus,
    @Query('from_date') String? fromDate,
    @Query('to_date') String? toDate,
    @Query('search') String? search,
    @Query('sort_by') String? sortBy,
    @Query('sort_order') String? sortOrder,
  });

  @GET('/orders/{id}')
  Future<OrderModel> getOrderById(@Path('id') String id);

  @POST('/orders')
  Future<OrderModel> createOrder(@Body() CreateOrderRequest request);

  @PUT('/orders/{id}')
  Future<OrderModel> updateOrder(
    @Path('id') String id,
    @Body() UpdateOrderRequest request,
  );

  @DELETE('/orders/{id}')
  Future<void> deleteOrder(@Path('id') String id);

  // Order Status Transitions
  @POST('/orders/{id}/confirm')
  Future<OrderModel> confirmOrder(@Path('id') String id);

  @POST('/orders/{id}/ship')
  Future<OrderModel> shipOrder(@Path('id') String id);

  @POST('/orders/{id}/deliver')
  Future<OrderModel> deliverOrder(@Path('id') String id);

  @POST('/orders/{id}/cancel')
  Future<OrderModel> cancelOrder(@Path('id') String id);

  // Payment Operations
  @POST('/orders/{id}/payments')
  Future<PaymentModel> recordPayment(
    @Path('id') String id,
    @Body() RecordPaymentRequest request,
  );

  @GET('/orders/{id}/payments')
  Future<List<PaymentModel>> getOrderPayments(@Path('id') String id);
}

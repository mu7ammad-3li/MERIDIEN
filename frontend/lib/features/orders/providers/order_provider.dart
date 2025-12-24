import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/order_state.dart';
import '../../../data/models/order_model.dart';
import '../../../data/repositories/order_repository.dart';
import '../../../data/providers/repository_providers.dart';

// Order List Provider
class OrderListNotifier extends StateNotifier<OrderListState> {
  final OrderRepository _repository;

  OrderListNotifier(this._repository) : super(const OrderListState.initial());

  Future<void> loadOrders({
    int page = 1,
    int perPage = 20,
    String? customerId,
    String? status,
    String? paymentStatus,
    String? fromDate,
    String? toDate,
    String? search,
    String? sortBy,
    String? sortOrder,
  }) async {
    try {
      if (page == 1) {
        state = const OrderListState.loading();
      }

      final orders = await _repository.getOrders(
        page: page,
        perPage: perPage,
        customerId: customerId,
        status: status,
        paymentStatus: paymentStatus,
        fromDate: fromDate,
        toDate: toDate,
        search: search,
        sortBy: sortBy,
        sortOrder: sortOrder,
      );

      state = OrderListState.loaded(
        orders: orders,
        total: orders.length,
        page: page,
        hasMore: orders.length >= perPage,
      );
    } catch (e) {
      state = OrderListState.error(_extractErrorMessage(e));
    }
  }

  Future<void> refresh() async {
    await loadOrders(page: 1);
  }

  Future<void> deleteOrder(String id) async {
    try {
      await _repository.deleteOrder(id);
      await refresh();
    } catch (e) {
      state = OrderListState.error(_extractErrorMessage(e));
    }
  }

  String _extractErrorMessage(dynamic error) {
    if (error is DioException) {
      if (error.response?.data is Map) {
        final data = error.response!.data as Map<String, dynamic>;
        return data['error'] ?? data['message'] ?? 'An error occurred';
      }
      return error.message ?? 'Network error occurred';
    }
    return error.toString();
  }
}

final orderListProvider =
    StateNotifierProvider<OrderListNotifier, OrderListState>((ref) {
  final repository = ref.watch(orderRepositoryProvider);
  return OrderListNotifier(repository);
});

// Order Detail Provider
class OrderDetailNotifier extends StateNotifier<OrderDetailState> {
  final OrderRepository _repository;

  OrderDetailNotifier(this._repository)
      : super(const OrderDetailState.initial());

  Future<void> loadOrder(String id) async {
    try {
      state = const OrderDetailState.loading();
      final order = await _repository.getOrderById(id);
      state = OrderDetailState.loaded(order);
    } catch (e) {
      state = OrderDetailState.error(_extractErrorMessage(e));
    }
  }

  Future<OrderModel?> createOrder(CreateOrderRequest request) async {
    try {
      final order = await _repository.createOrder(request);
      return order;
    } catch (e) {
      state = OrderDetailState.error(_extractErrorMessage(e));
      return null;
    }
  }

  Future<OrderModel?> updateOrder(
      String id, UpdateOrderRequest request) async {
    try {
      final order = await _repository.updateOrder(id, request);
      state = OrderDetailState.loaded(order);
      return order;
    } catch (e) {
      state = OrderDetailState.error(_extractErrorMessage(e));
      return null;
    }
  }

  Future<OrderModel?> confirmOrder(String id) async {
    try {
      state = const OrderDetailState.loading();
      final order = await _repository.confirmOrder(id);
      state = OrderDetailState.loaded(order);
      return order;
    } catch (e) {
      state = OrderDetailState.error(_extractErrorMessage(e));
      return null;
    }
  }

  Future<OrderModel?> shipOrder(String id) async {
    try {
      state = const OrderDetailState.loading();
      final order = await _repository.shipOrder(id);
      state = OrderDetailState.loaded(order);
      return order;
    } catch (e) {
      state = OrderDetailState.error(_extractErrorMessage(e));
      return null;
    }
  }

  Future<OrderModel?> deliverOrder(String id) async {
    try {
      state = const OrderDetailState.loading();
      final order = await _repository.deliverOrder(id);
      state = OrderDetailState.loaded(order);
      return order;
    } catch (e) {
      state = OrderDetailState.error(_extractErrorMessage(e));
      return null;
    }
  }

  Future<OrderModel?> cancelOrder(String id) async {
    try {
      state = const OrderDetailState.loading();
      final order = await _repository.cancelOrder(id);
      state = OrderDetailState.loaded(order);
      return order;
    } catch (e) {
      state = OrderDetailState.error(_extractErrorMessage(e));
      return null;
    }
  }

  Future<PaymentModel?> recordPayment(
      String orderId, RecordPaymentRequest request) async {
    try {
      final payment = await _repository.recordPayment(orderId, request);
      // Reload order to get updated payment status
      await loadOrder(orderId);
      return payment;
    } catch (e) {
      state = OrderDetailState.error(_extractErrorMessage(e));
      return null;
    }
  }

  Future<List<PaymentModel>> getOrderPayments(String orderId) async {
    try {
      return await _repository.getOrderPayments(orderId);
    } catch (e) {
      state = OrderDetailState.error(_extractErrorMessage(e));
      return [];
    }
  }

  String _extractErrorMessage(dynamic error) {
    if (error is DioException) {
      if (error.response?.data is Map) {
        final data = error.response!.data as Map<String, dynamic>;
        return data['error'] ?? data['message'] ?? 'An error occurred';
      }
      return error.message ?? 'Network error occurred';
    }
    return error.toString();
  }
}

final orderDetailProvider =
    StateNotifierProvider<OrderDetailNotifier, OrderDetailState>((ref) {
  final repository = ref.watch(orderRepositoryProvider);
  return OrderDetailNotifier(repository);
});

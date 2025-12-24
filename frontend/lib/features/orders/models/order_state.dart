import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../data/models/order_model.dart';

part 'order_state.freezed.dart';

@freezed
class OrderListState with _$OrderListState {
  const factory OrderListState.initial() = _Initial;
  const factory OrderListState.loading() = _Loading;
  const factory OrderListState.loaded({
    required List<OrderModel> orders,
    required int total,
    required int page,
    required bool hasMore,
  }) = _Loaded;
  const factory OrderListState.error(String message) = _Error;
}

@freezed
class OrderDetailState with _$OrderDetailState {
  const factory OrderDetailState.initial() = _DetailInitial;
  const factory OrderDetailState.loading() = _DetailLoading;
  const factory OrderDetailState.loaded(OrderModel order) = _DetailLoaded;
  const factory OrderDetailState.error(String message) = _DetailError;
}

@freezed
class OrderFormState with _$OrderFormState {
  const factory OrderFormState.initial() = _FormInitial;
  const factory OrderFormState.submitting() = _FormSubmitting;
  const factory OrderFormState.success(OrderModel order) = _FormSuccess;
  const factory OrderFormState.error(String message) = _FormError;
}

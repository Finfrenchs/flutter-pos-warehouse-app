part of 'order_bloc.dart';

@freezed
class OrderState with _$OrderState {
  const factory OrderState.initial() = _Initial;
  const factory OrderState.loading() = _Loading;
  const factory OrderState.success(List<Order> data) = _Success;
  const factory OrderState.successAdd(OrderCreateResponseModel data) =
      _SuccessAdd;
  const factory OrderState.failed(String message) = _Failed;
}

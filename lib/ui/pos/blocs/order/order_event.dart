part of 'order_bloc.dart';

@freezed
class OrderEvent with _$OrderEvent {
  const factory OrderEvent.started() = _Started;
  const factory OrderEvent.fetch() = _Fetch;
  const factory OrderEvent.doOrder({
    required int userId,
    required String customerNote,
    required String orderNumber,
    required int total,
    required String status,
    required String paymentStatus,
    required String paymentType,
    required List<OrderItemModel> items,
  }) = _DoOrder;
}

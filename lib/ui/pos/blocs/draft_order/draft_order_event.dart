part of 'draft_order_bloc.dart';

@freezed
class DraftOrderEvent with _$DraftOrderEvent {
  const factory DraftOrderEvent.started() = _Started;
  const factory DraftOrderEvent.fetch() = _Fetch;
  const factory DraftOrderEvent.detail(int id) = _Detail;
  const factory DraftOrderEvent.addDraft({
    required int userId,
    required String customerNote,
    required String orderNumber,
    required int total,
    required String status,
    required String paymentStatus,
    required String paymentType,
    required List<DraftOrderItemModel> items,
  }) = _AddDraft;
  const factory DraftOrderEvent.editDraft({
    required int id,
    required String status,
    required String paymentStatus,
  }) = _EditDraft;
}

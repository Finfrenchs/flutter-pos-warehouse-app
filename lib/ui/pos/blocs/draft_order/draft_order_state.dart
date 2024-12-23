part of 'draft_order_bloc.dart';

@freezed
class DraftOrderState with _$DraftOrderState {
  const factory DraftOrderState.initial() = _Initial;
  const factory DraftOrderState.loading() = _Loading;
  const factory DraftOrderState.success(DraftOrdersResponseModel data) =
      _Success;
  const factory DraftOrderState.successDetail(
      DraftOrdersDetailResponseModel data) = _SuccessDetail;
  const factory DraftOrderState.successCu(
      DraftOrderCreateUpdateResponseModel data) = _SuccessCu;
  const factory DraftOrderState.failed(String message) = _Failed;
}

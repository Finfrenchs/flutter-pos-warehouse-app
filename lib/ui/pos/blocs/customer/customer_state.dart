part of 'customer_bloc.dart';

@freezed
class CustomerState with _$CustomerState {
  const factory CustomerState.initial() = _Initial;
  const factory CustomerState.loading() = _Loading;
  const factory CustomerState.success(List<Customer> data) = _Success;
  const factory CustomerState.successAdd(CustomerAddResponseModel data) =
      _SuccessAdd;
  const factory CustomerState.failed(String message) = _Failed;
}

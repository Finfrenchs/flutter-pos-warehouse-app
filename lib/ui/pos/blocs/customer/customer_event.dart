part of 'customer_bloc.dart';

@freezed
class CustomerEvent with _$CustomerEvent {
  const factory CustomerEvent.started() = _Started;
  const factory CustomerEvent.fetch() = _Fetch;
  const factory CustomerEvent.add(CustomerRequestModel dataReq) = _Add;
}

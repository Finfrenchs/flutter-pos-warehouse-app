// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/data_source/pos/customer_remote_data_source.dart';
import '../../../../data/models/request/pos_request/customer_request_model.dart';
import '../../../../data/models/response/pos_response/customer_add_response_model.dart';
import '../../../../data/models/response/pos_response/customers_response_model.dart';

part 'customer_bloc.freezed.dart';
part 'customer_event.dart';
part 'customer_state.dart';

class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  final CustomerRemoteDataSource dataSource;
  CustomerBloc(
    this.dataSource,
  ) : super(const _Initial()) {
    on<_Fetch>((event, emit) async {
      emit(const _Loading());

      final response = await dataSource.getCustomers();

      response.fold(
        (l) => emit(_Failed(l)),
        (r) => emit(
          _Success(r.data ?? []),
        ),
      );
    });

    on<_Add>((event, emit) async {
      emit(const _Loading());

      final response = await dataSource.addCustomer(event.dataReq);

      response.fold(
        (l) => emit(_Failed(l)),
        (r) => emit(
          _SuccessAdd(r),
        ),
      );
    });
  }
}

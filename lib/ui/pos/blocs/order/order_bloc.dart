// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/data_source/pos/order_remote_data_source.dart';
import '../../../../data/models/request/pos_request/order_request_model.dart';
import '../../../../data/models/response/pos_response/order_create_response_model.dart';
import '../../../../data/models/response/pos_response/orders_response_model.dart';

part 'order_bloc.freezed.dart';
part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final OrderRemoteDataSource dataSource;
  OrderBloc(
    this.dataSource,
  ) : super(const _Initial()) {
    on<_Fetch>((event, emit) async {
      emit(const _Loading());

      final response = await dataSource.getOrders();

      response.fold(
        (l) => emit(_Failed(l)),
        (r) => emit(_Success(r.data?.data ?? [])),
      );
    });

    on<_DoOrder>((event, emit) async {
      emit(const _Loading());

      final orderRequest = OrderRequestModel(
        userId: event.userId,
        customerNote: event.customerNote,
        orderNumber: event.orderNumber,
        total: event.total,
        status: event.status,
        paymentStatus: event.paymentStatus,
        paymentType: event.paymentType,
        items: event.items
            .map((e) => OrderItemModel(
                productId: e.productId,
                quantity: e.quantity,
                price: e.price,
                total: e.total))
            .toList(),
      );

      final response = await dataSource.order(orderRequest);

      response.fold(
        (l) => emit(_Failed(l)),
        (r) => emit(_SuccessAdd(r)),
      );
    });
  }
}

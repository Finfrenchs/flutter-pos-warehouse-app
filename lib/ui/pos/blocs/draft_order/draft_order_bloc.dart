// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/data_source/pos/draft_order_remote_data_source.dart';
import '../../../../data/models/request/pos_request/draft_order_request_model.dart';
import '../../../../data/models/response/pos_response/draft_order_create_update_response_model.dart';
import '../../../../data/models/response/pos_response/draft_order_detail_response_model.dart';
import '../../../../data/models/response/pos_response/draft_orders_response_model.dart';

part 'draft_order_bloc.freezed.dart';
part 'draft_order_event.dart';
part 'draft_order_state.dart';

class DraftOrderBloc extends Bloc<DraftOrderEvent, DraftOrderState> {
  final DraftOrderRemoteDataSource dataSource;
  DraftOrderBloc(
    this.dataSource,
  ) : super(const _Initial()) {
    on<_Fetch>((event, emit) async {
      emit(const _Loading());

      final response = await dataSource.getDraftOrders();

      response.fold(
        (l) => emit(_Failed(l)),
        (r) => emit(_Success(r)),
      );
    });
    on<_Detail>((event, emit) async {
      emit(const _Loading());

      final response = await dataSource.getDraftOrderById(event.id);

      response.fold(
        (l) => emit(_Failed(l)),
        (r) => emit(_SuccessDetail(r)),
      );
    });

    on<_AddDraft>((event, emit) async {
      emit(const _Loading());

      final orderRequest = DraftOrderRequestModel(
        userId: event.userId,
        customerNote: event.customerNote,
        orderNumber: event.orderNumber,
        total: event.total,
        status: event.status,
        paymentStatus: event.paymentStatus,
        paymentType: event.paymentType,
        items: event.items
            .map((e) => DraftOrderItemModel(
                productId: e.productId,
                quantity: e.quantity,
                price: e.price,
                total: e.total))
            .toList(),
      );

      final response = await dataSource.draftOrder(orderRequest);

      response.fold(
        (l) => emit(_Failed(l)),
        (r) => emit(_SuccessCu(r)),
      );
    });

    on<_EditDraft>((event, emit) async {
      emit(const _Loading());

      final response = await dataSource.update(
          id: event.id,
          status: event.status,
          paymentStatus: event.paymentStatus);

      response.fold(
        (l) => emit(_Failed(l)),
        (r) => emit(_SuccessCu(r)),
      );
    });
  }
}

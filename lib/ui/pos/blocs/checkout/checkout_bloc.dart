import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/models/response/inventory_response/product_response_model.dart';
import '../../models/order_item_model.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';
part 'checkout_bloc.freezed.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  CheckoutBloc() : super(const _Success([], 0, 0)) {
    on<_AddCheckout>((event, emit) {
      var currentState = state as _Success;
      List<OrderItem> newCheckout = [...currentState.products];
      emit(const _Loading());
      if (newCheckout.any((element) => element.product == event.product)) {
        var index = newCheckout
            .indexWhere((element) => element.product == event.product);
        newCheckout[index].quantity++;
      } else {
        newCheckout.add(OrderItem(product: event.product, quantity: 1));
      }

      int totalQuantity = 0;
      int totalPrice = 0;
      for (var element in newCheckout) {
        totalQuantity += element.quantity;
        totalPrice += element.quantity * element.product.price!;
      }

      emit(_Success(newCheckout, totalQuantity, totalPrice));
    });

    on<_RemoveCheckout>((event, emit) {
      var currentState = state as _Success;
      List<OrderItem> newCheckout = [...currentState.products];
      emit(const _Loading());
      if (newCheckout.any((element) => element.product == event.product)) {
        var index = newCheckout
            .indexWhere((element) => element.product == event.product);

        if (newCheckout[index].quantity == 1) {
          newCheckout.removeAt(index);
        } else {
          newCheckout[index].quantity--;
        }
      }

      int totalQuantity = 0;
      int totalPrice = 0;
      for (var element in newCheckout) {
        totalQuantity += element.quantity;
        totalPrice += element.quantity * element.product.price!;
      }

      emit(_Success(newCheckout, totalQuantity, totalPrice));
    });

    on<_Started>((event, emit) {
      emit(const _Loading());
      emit(const _Success([], 0, 0));
    });
  }
}

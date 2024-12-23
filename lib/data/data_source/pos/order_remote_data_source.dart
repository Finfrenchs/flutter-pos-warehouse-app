import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../../core/core.dart';
import '../../models/request/pos_request/order_request_model.dart';
import '../../models/response/pos_response/order_create_response_model.dart';
import '../../models/response/pos_response/orders_response_model.dart';
import '../auth_local_data_source.dart';
import '../base_error_response_model.dart';

class OrderRemoteDataSource {
  Future<Either<String, OrderCreateResponseModel>> order(
      OrderRequestModel orderRequestModel) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${authData!.accessToken}',
      'Content-type': 'application/json',
    };
    const path = '/api/order';
    final url = Uri.parse('${Variables.baseUrl}$path');
    final response = await http.post(
      url,
      headers: headers,
      body: orderRequestModel.toJson(),
    );

    if (response.statusCode == 201) {
      return right(OrderCreateResponseModel.fromJson(response.body));
    } else {
      final errorModel = baseErrorResponseModelFromJson(response.body);
      return left(errorModel.error);
    }
  }

  // Future<Either<String, OrderResponseModel>> getOrderById(int orderId) async {
  //   final authData = await AuthLocalDataSource().getAuthData();
  //   final response = await http.get(
  //     Uri.parse('${Variables.baseUrl}/api/order/$orderId'),
  //     headers: {
  //       'Accept': 'application/json',
  //       'Content-type': 'application/json',
  //       'Authorization': 'Bearer ${authData!.accessToken}'
  //     },
  //   );

  //   if (response.statusCode == 200) {
  //     final order = OrderResponseModel.fromJson(response.body);
  //     return right(order);
  //   } else {
  //     return left('Error');
  //   }
  // }

  Future<Either<String, OrderResponseModel>> getOrders() async {
    final authData = await AuthLocalDataSource().getAuthData();
    final response = await http.get(
      Uri.parse('${Variables.baseUrl}/api/order'),
      headers: {
        'Accept': 'application/json',
        'Content-type': 'application/json',
        'Authorization': 'Bearer ${authData!.accessToken}'
      },
    );

    if (response.statusCode == 200) {
      final order = OrderResponseModel.fromJson(response.body);
      return right(order);
    } else {
      final errorModel = baseErrorResponseModelFromJson(response.body);
      return left(errorModel.error);
    }
  }
}

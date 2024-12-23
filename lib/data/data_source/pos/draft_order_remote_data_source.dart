import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../../core/core.dart';
import '../../models/request/pos_request/draft_order_request_model.dart';
import '../../models/response/pos_response/draft_order_create_update_response_model.dart';
import '../../models/response/pos_response/draft_order_detail_response_model.dart';
import '../../models/response/pos_response/draft_orders_response_model.dart';
import '../auth_local_data_source.dart';
import '../base_error_response_model.dart';

class DraftOrderRemoteDataSource {
  Future<Either<String, DraftOrderCreateUpdateResponseModel>> draftOrder(
      DraftOrderRequestModel draftOrderRequestModel) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${authData!.accessToken}',
      'Content-type': 'application/json',
    };
    const path = '/api/draft-order';
    final url = Uri.parse('${Variables.baseUrl}$path');
    final response = await http.post(
      url,
      headers: headers,
      body: draftOrderRequestModel.toJson(),
    );

    if (response.statusCode == 201) {
      return right(DraftOrderCreateUpdateResponseModel.fromJson(response.body));
    } else {
      final errorModel = baseErrorResponseModelFromJson(response.body);
      return left(errorModel.error);
    }
  }

  Future<Either<String, DraftOrderCreateUpdateResponseModel>> update(
      {required int id,
      required String status,
      required String paymentStatus}) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${authData!.accessToken}',
      'Content-type': 'application/json',
    };
    final path = '/api/draft-order/$id';
    final url = Uri.parse('${Variables.baseUrl}$path');
    final response = await http.put(
      url,
      headers: headers,
      body: json.encode({"status": status, "payment_status": paymentStatus}),
    );

    if (response.statusCode == 200) {
      return right(DraftOrderCreateUpdateResponseModel.fromJson(response.body));
    } else {
      final errorModel = baseErrorResponseModelFromJson(response.body);
      return left(errorModel.error);
    }
  }

  Future<Either<String, DraftOrdersDetailResponseModel>> getDraftOrderById(
      int id) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final response = await http.get(
      Uri.parse(
        '${Variables.baseUrl}/api/draft-order/$id',
      ),
      headers: {
        'Accept': 'application/json',
        'Content-type': 'application/json',
        'Authorization': 'Bearer ${authData!.accessToken}'
      },
    );

    if (response.statusCode == 200) {
      final order = DraftOrdersDetailResponseModel.fromJson(response.body);
      return right(order);
    } else {
      final errorModel = baseErrorResponseModelFromJson(response.body);
      return left(errorModel.error);
    }
  }

  Future<Either<String, DraftOrdersResponseModel>> getDraftOrders() async {
    final authData = await AuthLocalDataSource().getAuthData();
    final response = await http.get(
      Uri.parse('${Variables.baseUrl}/api/draft-order'),
      headers: {
        'Accept': 'application/json',
        'Content-type': 'application/json',
        'Authorization': 'Bearer ${authData!.accessToken}'
      },
    );

    if (response.statusCode == 200) {
      final order = DraftOrdersResponseModel.fromJson(response.body);
      return right(order);
    } else {
      final errorModel = baseErrorResponseModelFromJson(response.body);
      return left(errorModel.error);
    }
  }
}

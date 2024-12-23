import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';

import '../../../core/core.dart';
import '../../models/request/pos_request/customer_request_model.dart';
import '../../models/response/pos_response/customer_add_response_model.dart';
import '../../models/response/pos_response/customers_response_model.dart';
import '../auth_local_data_source.dart';
import '../base_error_response_model.dart';

class CustomerRemoteDataSource {
  Future<Either<String, CustomersResponseModel>> getCustomers() async {
    final authData = await AuthLocalDataSource().getAuthData();
    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${authData!.accessToken}'
    };
    const path = '/api/get-customer';
    final url = Uri.parse('${Variables.baseUrl}$path');
    final response = await http.get(
      url,
      headers: headers,
    );

    if (response.statusCode == 200) {
      return right(CustomersResponseModel.fromJson(response.body));
    } else {
      final errorModel = baseErrorResponseModelFromJson(response.body);
      return left(errorModel.error);
    }
  }

  Future<Either<String, CustomerAddResponseModel>> addCustomer(
      CustomerRequestModel dataRequest) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${authData!.accessToken}',
      'Content-type': 'application/json',
    };
    const path = '/api/create-customer';
    final url = Uri.parse('${Variables.baseUrl}$path');
    final response = await http.post(
      url,
      headers: headers,
      body: dataRequest.toJson(),
    );

    if (response.statusCode == 201) {
      return right(CustomerAddResponseModel.fromJson(response.body));
    } else {
      final errorModel = baseErrorResponseModelFromJson(response.body);
      return left(errorModel.error);
    }
  }
}

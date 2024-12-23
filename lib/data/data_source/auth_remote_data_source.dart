import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import '../../core/constants/constants.dart';

import '../models/response/auth_response_model.dart';
import 'auth_local_data_source.dart';

class AuthRemoteDataSource {
  Future<Either<String, AuthResponseModel>> login(
    String email,
    String password,
  ) async {
    final headers = {
      'Accept': 'application/json',
    };
    const path = '/api/login';
    final url = Uri.parse('${Variables.baseUrl}$path');
    final response = await http.post(
      url,
      body: {
        "email": email,
        "password": password,
      },
      headers: headers,
    );

    if (response.statusCode == 200) {
      await AuthLocalDataSource()
          .saveAuthData(AuthResponseModel.fromJson(response.body));
      return Right(AuthResponseModel.fromJson(response.body));
    } else {
      return const Left('Login failed');
    }
  }

  Future<Either<String, AuthResponseModel>> logout() async {
    final authDataModel = await AuthLocalDataSource().getAuthData();
    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${authDataModel?.accessToken}',
    };
    final url = Uri.parse('${Variables.baseUrl}/api/logout');
    final response = await http.post(
      url,
      headers: headers,
    );

    if (response.statusCode == 200) {
      await AuthLocalDataSource().removeAuthData();
      return Right(AuthResponseModel.fromJson(response.body));
    } else {
      return const Left('Logout failed');
    }
  }

  // Future<Either<String, String>> updateFcmToken(String fcmToken) async {
  //   final authData = await AuthLocalDataSource().getAuthData();
  //   final response = await http.post(
  //     Uri.parse('${Variables.baseUrl}/api/update-fcm'),
  //     headers: {
  //       'Authorization': 'Bearer ${authData?.accessToken}',
  //       'Accept': 'application/json',
  //     },
  //     body: {'fcm_id': fcmToken},
  //   );

  //   if (response.statusCode == 200) {
  //     return Right(response.body);
  //   } else {
  //     return Left(response.body);
  //   }
  // }
}

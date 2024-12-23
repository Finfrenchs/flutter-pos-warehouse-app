import "dart:convert";

import "package:shared_preferences/shared_preferences.dart";

import "../models/response/auth_response_model.dart";

class AuthLocalDataSource {
  Future<void> saveAuthData(AuthResponseModel authResponseModel) async {
    // Save auth data to local storage
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_data', authResponseModel.toJson());
  }

  Future<void> reSaveAuthData(User user) async {
    // Save auth data to local storage
    final prefs = await SharedPreferences.getInstance();
    final authData = prefs.getString('auth_data');
    AuthResponseModel authResponseModel =
        AuthResponseModel.fromMap(jsonDecode(authData!));
    final newData = authResponseModel.copyWith(user: user);
    await prefs.setString('auth_data', newData.toJson());
  }

  Future<void> removeAuthData() async {
    // Remove auth data from local storage
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_data');
  }

  Future<AuthResponseModel?> getAuthData() async {
    // Get auth data from local storage
    final prefs = await SharedPreferences.getInstance();
    final authData = prefs.getString('auth_data');
    if (authData != null) {
      return AuthResponseModel.fromJson(authData);
    } else {
      return null;
    }
  }

  Future<bool> isUserLoggedIn() async {
    // Check if user is logged in
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey('auth_data');
  }

  Future<User?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final authData = prefs.getString('auth_data');
    if (authData != null) {
      final auth = AuthResponseModel.fromJson(authData);
      return auth.user;
    } else {
      return null;
    }
  }
}

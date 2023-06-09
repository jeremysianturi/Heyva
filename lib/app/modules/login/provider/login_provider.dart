import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:heyva/app/modules/login/model/login_model.dart';

class LoginProvider {
  final Dio _client;

  LoginProvider(this._client);

  Future<LoginModel?> Login(
      {required username, required password, required device_id}) async {
    LoginModel? res;
    try {
      Response response = await _client.post(
        '/api/v1/users/login',
        data: {
          "username": username,
          "password": password,
          "device_id": device_id
        },
      );
      debugPrint('response data: ${response.data}');
      res = LoginModel.fromJson(response.data);
    } on DioError catch (e) {
      var message = e.response?.data['message'];
      var error = e.response?.data['error'];
      res = LoginModel(success: "", data: null, message: message, error: error);
    }
    return res;
  }

  Future<LoginModel?> refreshToken(
      {required userId, required refreshToken}) async {
    LoginModel? res;
    try {
      Response response = await _client.post(
        '/api/v1/users/refresh-token',
        data: {"id": userId, "refresh_token": refreshToken},
      );
      debugPrint('response data: ${response.data}');
      res = LoginModel.fromJson(response.data);
    } on DioError catch (e) {
      var message = e.response?.data['message'];
      var error = e.response?.data['error'];
      res = LoginModel(success: "", data: null, message: message, error: error);
    }
    return res;
  }

  Future<LoginModel?> LoginWithGoole(
      {required googleId, required email}) async {
    LoginModel? res;
    try {
      Response response = await _client.post(
        '/api/v1/users/login/google',
        data: {"google_id": googleId, "email": email},
      );
      debugPrint('response data: ${response.data}');
      res = LoginModel.fromJson(response.data);
    } on DioError catch (e) {
      var message = e.response?.data['message'];
      var error = e.response?.data['error'];
      res = LoginModel(success: "", data: null, message: message, error: error);
    }
    return res;
  }
}

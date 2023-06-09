import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:heyva/app/modules/reset_password/model/reset_password_model.dart';

class ResetPasswordProvider {
  final Dio _client;

  ResetPasswordProvider(this._client);

  Future<ResetPasswordModel?> postResetPassword({required email}) async {
    ResetPasswordModel? res;
    try {
      Response response = await _client.post(
        '/api/v1/users/request-reset-password',
        data: {"email": email},
      );
      debugPrint('response data: ${response.data}');
      res = ResetPasswordModel.fromJson(response.data);
    } on DioError catch (e) {
      var message = e.response?.data['message'];
      var error = e.response?.data['error'];
      res = ResetPasswordModel(
          success: "", data: null, message: message, error: error);
    }
    return res;
  }
}

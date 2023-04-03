import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:heyva/app/modules/register/model/register_model.dart';
import 'package:heyva/app/modules/register/model/register_storage_model.dart';

class RegisterProvider {
  final Dio _client;

  RegisterProvider(this._client);

  Future<RegisterModel?> Register({required RegisterStorageModel data}) async {
    RegisterModel? res;
    try {
      Response response = await _client.post(
        '/api/v1/users/register',
        data: {
          "email": data.email,
          "password": data.password,
          "full_name": data.fullName,
          "birth_date": data.birthDate.split(" ")[0],
          "pregnancy_status": data.pregnancyStatus,
          "interests": data.interests
        },
      );
      debugPrint('response data: ${response.data}');
      res = RegisterModel.fromJson(response.data);
    } on DioError catch (e) {
      var message = e.response?.data['message'];
      var error = e.response?.data['error'];
      res = RegisterModel(success: "", data: null, message: message, error: error);
    }
    return res;
  }
}

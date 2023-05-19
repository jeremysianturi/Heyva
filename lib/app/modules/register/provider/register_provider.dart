import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:heyva/app/modules/register/model/register_model.dart';
import 'package:heyva/app/modules/register/model/register_storage_model.dart';
import 'package:heyva/app/modules/register/model/verified_model.dart';

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
          "interests": data.interests,
          if (data.childBirthDate != "")
            "child_birth_date": data.childBirthDate != ""
                ? data.childBirthDate.split(" ")[0]
                : "",
          if (data.estimateDueDate != "")
            "estimated_due_date": data.estimateDueDate != ""
                ? data.estimateDueDate.split(" ")[0]
                : "",
        },
      );
      debugPrint('response data: ${response.data}');
      res = RegisterModel.fromJson(response.data);
    } on DioError catch (e) {
      var message = e.response?.data['message'];
      var error = e.response?.data['error'];
      res = RegisterModel(
          success: "", data: null, message: message, error: error);
    }
    return res;
  }

  Future<VerifiedModel?> cekVerified({required String email}) async {
    VerifiedModel? res;
    try {
      Response response = await _client.post(
        '/api/v1/users/check-verification',
        data: {
          "username": email,
        },
      );
      debugPrint('response data: ${response.data}');
      res = VerifiedModel.fromJson(response.data);
    } on DioError catch (e) {
      var message = e.response?.data['message'];
      var success = e.response?.data['success'];
      var error = e.response?.data['error'];
      res = VerifiedModel(
          success: success, data: null, message: message, error: error);
    }
    return res;
  }

  Future<RegisterModel?> RegisterwithGoogle({required RegisterStorageModel data}) async {
    RegisterModel? res;
    try {
      Response response = await _client.post(
        '/api/v1/users/register/google',
        data: {
          "email": data.email,
          "full_name": data.fullName,
          "google_id": data.googleId,
          "avatar": data.fullName,
          "birth_date": data.birthDate.split(" ")[0],
          "pregnancy_status": data.pregnancyStatus,
          "interests": data.interests,
          if (data.childBirthDate != "")
            "child_birth_date": data.childBirthDate != ""
                ? data.childBirthDate.split(" ")[0]
                : "",
          if (data.estimateDueDate != "")
            "estimated_due_date": data.estimateDueDate != ""
                ? data.estimateDueDate.split(" ")[0]
                : "",
        },
      );
      debugPrint('response data: ${response.data}');
      res = RegisterModel.fromJson(response.data);
    } on DioError catch (e) {
      var message = e.response?.data['message'];
      var error = e.response?.data['error'];
      res = RegisterModel(
          success: "", data: null, message: message, error: error);
    }
    return res;
  }
}

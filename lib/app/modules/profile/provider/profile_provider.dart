import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:heyva/app/modules/profile/model/profile_model.dart';

class ProfileProvider {
  final Dio _client;

  ProfileProvider(this._client);

  Future<ProfileModel?> getProfile() async {
    ProfileModel? res;
    try {
      Response response = await _client.get(
        '/api/v1/profile',
      );
      debugPrint('response data: ${response.data}');
      res = ProfileModel.fromJson(response.data);
    } on DioError catch (e) {
      var message = e.response?.data['message'];
      var error = e.response?.data['error'];
      res =
          ProfileModel(success: "", data: null, message: message, error: error);
    }
    return res;
  }
}

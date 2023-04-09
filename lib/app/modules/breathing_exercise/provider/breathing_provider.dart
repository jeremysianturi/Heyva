import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:heyva/app/modules/breathing_exercise/model/breathing_model.dart';

class BreathingProvider {
  final Dio _client;

  BreathingProvider(this._client);

  Future<BreathingModel?> getBreathingProgram() async {
    BreathingModel? res;
    try {
      Response response = await _client.get(
        '/api/v1/program/122c9171-7d1b-4643-8093-86380f893bb7',
      );
      debugPrint('response data: ${response.data}');
      res = BreathingModel.fromJson(response.data);
    } on DioError catch (e) {
      var message = e.response?.data['message'];
      var error = e.response?.data['error'];
      res = BreathingModel(success: "", data: null, message: message, error: error);
    }
    return res;
  }
}

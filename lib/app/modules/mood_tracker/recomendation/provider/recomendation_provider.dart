import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:heyva/app/modules/mood_tracker/recomendation/model/recomendation_model.dart';

class RecomendationProvider {
  final Dio _client;

  RecomendationProvider(this._client);

  Future<RecomendationModel?> getRecomendation() async {
    RecomendationModel? res;
    try {
      Response response = await _client.get(
        '/api/v1/tracker-type/list?type=69d775c9-4f5b-45c0-93cc-f0b2a1502107',
      );
      debugPrint('response data: ${response.data}');
      res = RecomendationModel.fromJson(response.data);
    } on DioError catch (e) {
      var message = e.response?.data['message'];
      var error = e.response?.data['error'];
      res = RecomendationModel(
          success: "", data: null, message: message, error: error);
    }
    return res;
  }
}

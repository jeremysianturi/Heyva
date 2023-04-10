import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:heyva/app/modules/mood_tracker/recomendation2/model/recomendation_model.dart';

class RecomendationProvider {
  final Dio _client;

  RecomendationProvider(this._client);

  Future<RecomendationModel?> getRecomendation({required date}) async {
    RecomendationModel? res;
    try {
      Response response = await _client.get(
          '/api/v1/tracker-daily/recommendation?date=$date');
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

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:heyva/app/modules/insights/model/Insight_model.dart' as model;

class InsightProvider {
  final Dio _client;

  InsightProvider(this._client);

  Future<model.InsightModel?> getInsight(
  {
    required date1,
    required date2,
    required date3,

  }
      ) async {
    model.InsightModel? res;
    try {
      Response response = await _client.get(
        '/api/v1/tracker-daily/insight?date=$date1&date=$date2&date=$date3',
      );
      debugPrint('response data: ${response.data}');
      res = model.InsightModel.fromJson(response.data);
    } on DioError catch (e) {
      var message = e.response?.data['message'];
      var error = e.response?.data['error'];
      res = model.InsightModel(
          success: "", data: null, message: message, error: error);
    }
    return res;
  }
}

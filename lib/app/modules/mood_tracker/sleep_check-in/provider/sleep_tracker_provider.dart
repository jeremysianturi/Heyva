import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:heyva/app/modules/mood_tracker/sleep_check-in/model/tracker_type_sleep_model.dart';

class SleepTrackerProvider {
  final Dio _client;

  SleepTrackerProvider(this._client);

  Future<TrackerTypeSleepModel?> getTrackerSleep() async {
    TrackerTypeSleepModel? res;
    try {
      Response response = await _client.get(
        '/api/v1/tracker-type/list?type=ee96ab42-3400-4648-a469-2e479e9c19f9',
      );
      debugPrint('response data: ${response.data}');
      res = TrackerTypeSleepModel.fromJson(response.data);
    } on DioError catch (e) {
      var message = e.response?.data['message'];
      var error = e.response?.data['error'];
      res = TrackerTypeSleepModel(
          success: "", data: null, message: message, error: error);
    }
    return res;
  }
}

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:heyva/app/modules/mood_tracker/mood_tracker_form/model/tracker_type_mood_model.dart';

class MoodTrackerProvider {
  final Dio _client;

  MoodTrackerProvider(this._client);

  Future<TrackerTypeMoodModel?> getTrackerMood() async {
    TrackerTypeMoodModel? res;
    try {
      Response response = await _client.get(
        '/api/v1/tracker-type/list?type=297433c8-0424-4ff7-8343-8d5a614d0b34',
      );
      debugPrint('response data: ${response.data}');
      res = TrackerTypeMoodModel.fromJson(response.data);
    } on DioError catch (e) {
      var message = e.response?.data['message'];
      var error = e.response?.data['error'];
      res = TrackerTypeMoodModel(
          success: "", data: null, message: message, error: error);
    }
    return res;
  }
}

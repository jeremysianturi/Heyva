import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:heyva/app/modules/mood_tracker/model/tracker_create_model.dart';

class TrackerProvider {
  final Dio _client;

  TrackerProvider(this._client);

  Future<TrackerCreateModel?> createTracker({required json}) async {
    TrackerCreateModel? res;
    try {
      Response response = await _client.post(
        '/api/v1/tracker-daily/create',
        data: jsonEncode(json),
      );
      debugPrint('response data: ${response.data}');
      res = TrackerCreateModel.fromJson(response.data);
    } on DioError catch (e) {
      var message = e.response?.data['message'];
      var error = e.response?.data['error'];
      res = TrackerCreateModel(
          success: "", data: null, message: message, error: error);
    }
    return res;
  }
}

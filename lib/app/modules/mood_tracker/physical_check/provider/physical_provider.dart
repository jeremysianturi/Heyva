import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:heyva/app/modules/mood_tracker/physical_check/model/tracker_type_physical_model.dart';

class PhysicalProvider {
  final Dio _client;

  PhysicalProvider(this._client);

  Future<TrackerTypePhysicalModel?> getTrackerPhysical() async {
    TrackerTypePhysicalModel? res;
    try {
      Response response = await _client.get(
        '/api/v1/tracker-type/list?type=efaa63ea-4beb-4d86-aebd-b32cf0f635bb',
      );
      debugPrint('response data: ${response.data}');
      res = TrackerTypePhysicalModel.fromJson(response.data);
    } on DioError catch (e) {
      var message = e.response?.data['message'];
      var error = e.response?.data['error'];
      res = TrackerTypePhysicalModel(
          success: "", data: null, message: message, error: error);
    }
    return res;
  }
}

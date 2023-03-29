import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:heyva/app/modules/breast_feeding/model/video_content_model.dart';

class BreastFeedingProvider {
  final Dio _client;

  BreastFeedingProvider(this._client);

  Future<VideoContentModel?> getListVideo({required var contentId}) async {
    VideoContentModel? res;
    try {
      Response response = await _client.get(
        '/api/v1/video-content/$contentId',
      );
      debugPrint('response data: ${response.data}');
      res = VideoContentModel.fromJson(response.data);
    } on DioError catch (e) {
      var message = e.response?.data['message'];
      var error = e.response?.data['error'];
      res = VideoContentModel(
        success: "",
        data: null,
        // message: message,
        // error: error,
      );
    }
    return res;
  }
}

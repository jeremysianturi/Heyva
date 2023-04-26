import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:heyva/app/modules/learn/model/program_list_model.dart';

class LearnProvider {
  final Dio _client;

  LearnProvider(this._client);

  Future<ProgramListModel?> getProgramList() async {
    ProgramListModel? res;
    try {
      Response response = await _client.get(
        '/api/v1/program/list?search=',
      );
      debugPrint('response data: ${response.data}');
      res = ProgramListModel.fromJson(response.data);
    } on DioError catch (e) {
      var message = e.response?.data['message'];
      var error = e.response?.data['error'];
      res = ProgramListModel(
          success: "", data: null, message: message, error: error);
    }
    return res;
  }
}

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:heyva/app/modules/breathing/model/pelvic_model.dart';

class PelvicProvider {
  final Dio _client;

  PelvicProvider(this._client);

  Future<PelvicModel?> getPelvic() async {
    PelvicModel? res;
    try {
      Response response = await _client.get(
        '/api/v1/program/6e730c59-e600-4698-819a-55f827f41529',
      );
      debugPrint('response data: ${response.data}');
      res = PelvicModel.fromJson(response.data);
    } on DioError catch (e) {
      var message = e.response?.data['message'];
      var error = e.response?.data['error'];
      res = PelvicModel(success: "", data: null, message: message, error: error);
    }
    return res;
  }
}

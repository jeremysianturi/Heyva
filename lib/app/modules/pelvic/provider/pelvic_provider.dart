import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:heyva/app/modules/pelvic/model/pelvic_model.dart';

class PelvicProvider {
  final Dio _client;

  PelvicProvider(this._client);

  Future<PelvicModel?> getPelvic({required pelvicID}) async {
    PelvicModel? res;
    try {
      Response response = await _client.get(
        '/api/v1/program/$pelvicID',
      );
      debugPrint('response data: ${response.data}');
      res = PelvicModel.fromJson(response.data);
    } on DioError catch (e) {
      var message = e.response?.data['message'];
      var error = e.response?.data['error'];
      res =
          PelvicModel(success: "", data: null, message: message, error: error);
    }
    return res;
  }
}

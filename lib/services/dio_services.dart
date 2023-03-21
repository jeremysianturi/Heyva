import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'logging.dart';

class DioClient {
  Dio init() {
    String username = 'FE6zmxW4sX';
    String password = 'VPvVHc25Mx';
    String  basicAuth=
        'Basic ' + base64.encode(utf8.encode('$username:$password'));

    Dio _dio = Dio();
    _dio.interceptors.add(Logging());
    _dio.options = BaseOptions(
      baseUrl: "http://54.251.132.179:8000",
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': basicAuth
      },
      connectTimeout: 20.seconds,
      receiveTimeout: 10.seconds,
    );
    _dio.options.baseUrl = "http://54.251.132.179:8000";
    return _dio;
  }
}
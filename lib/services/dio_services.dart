
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:heyva/constant/variabels.dart';
import 'logging.dart';

class DioClient {
  Dio init() {
    Dio _dio = Dio();
    _dio.interceptors.add(Logging());
    _dio.options = BaseOptions(
      baseUrl: "http://api-service.heyva.health",
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization':
            authToken != "null" || authToken != "" ? basicAuthToken : authToken,
      },
      connectTimeout: 20.seconds,
      receiveTimeout: 10.seconds,
    );
    _dio.options.baseUrl = "http://api-service.heyva.health";
    return _dio;
  }
}

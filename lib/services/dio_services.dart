import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heyva/constant/keys.dart';
import 'package:heyva/constant/variabels.dart';
import 'logging.dart';

class DioClient {
  Dio init() {
    var box = GetStorage();
    Dio _dio = Dio();
    _dio.interceptors.add(Logging());
    _dio.options = BaseOptions(
      baseUrl: "http://54.251.132.179:8000/",
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': box.read(Keys.loginAccessToken).toString() != "null"
            ? "Bearer ${box.read(Keys.loginAccessToken)}"
            : basicAuthToken,
      },
      connectTimeout: 20.seconds,
      receiveTimeout: 10.seconds,
    );
    _dio.options.baseUrl = "http://54.251.132.179:8000/";
    return _dio;
  }
}

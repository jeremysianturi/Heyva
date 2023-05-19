import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as gt;
import 'package:get_storage/get_storage.dart';
import 'package:heyva/app/modules/login/controllers/login_controller.dart';
import 'package:heyva/app/routes/app_pages.dart';
import 'package:heyva/app/widgets/reusable_bottomSheet_message.dart';
import 'package:heyva/constant/keys.dart';
import 'package:heyva/constant/strings.dart';
import 'package:heyva/constant/variabels.dart';

class Logging extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint('REQUEST[${options.method}] => PATH: ${options.path}');
    debugPrint(
      'REQUEST[${options.data}] ',
    );
    debugPrint(
      'URL [${options.uri}] ',
    );
    debugPrint(
      'REQUEST[${options.headers}] ',
    );
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint(
      'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
    );
    debugPrint(
      'RESPONSE[${response.data}] ',
    );
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    /// hadling error
    debugPrint(
      'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}',
    );

    debugPrint("status code${(err.response?.statusCode == 401)}");
    debugPrint("status code${(err.response?.data['message'])}");
    if (err.response?.statusCode == 401 &&
        err.requestOptions.path != "/api/v1/users/refresh-token" &&
        err.response?.data['message'] == "Expired Signature") {
      var loginC = gt.Get.put(LoginController());
      loginC.refresh();
    } else if (err.response?.statusCode == 401 &&
        err.requestOptions.path == "/api/v1/users/refresh-token") {
      var box = GetStorage();
      box.remove(Keys.loginAccessToken);
      box.remove(Keys.loginRefreshToken);
      box.remove(Keys.loginID);
      authToken = "";
      refreshToken = "";
      Future.delayed(800.seconds);
      gt.Get.offNamed(Routes.SIGNUP);
    }
    debugPrint(
      'ERROR[${err.response?.data}] ',
    );
    if (err.response.toString() == "null") {
      bottomSheetMessage(color: "red", desc: Strings.internetError);
    }
    return super.onError(err, handler);
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heyva/app/modules/login/model/login_model.dart';
import 'package:heyva/app/modules/register/model/register_storage_model.dart';
import 'package:heyva/app/routes/app_pages.dart';
import 'package:heyva/constant/keys.dart';
import 'package:heyva/constant/variabels.dart';
import 'package:heyva/services/dio_services.dart';

import '../../../login/provider/login_provider.dart';

class OnboardingFinishController extends GetxController {
  var isLoading = false.obs;
  late RefreshDioClient _client;
  late LoginProvider _provider;
  var errorMessage = ''.obs;
  var box = GetStorage();

  String get username {
    var boxData = box.read(Keys.registStorage) as RegisterStorageModel;
    return boxData.fullName;
  }

  @override
  void onInit() {
    _client = RefreshDioClient();
    _provider = LoginProvider(_client.init());
    super.onInit();
  }

  var loginResonse =
      LoginModel(success: "", data: null, message: "", error: "").obs;

  postLogin() async {
    errorMessage.value = "";
    isLoading.value = true;
    try {
      var boxData = box.read(Keys.registStorage) as RegisterStorageModel;

      loginResonse.value = (await _provider.Login(
          username: boxData.email, password: boxData.password))!;

      if (loginResonse.value.success == "Success") {
        var box = GetStorage();
        box.write(
            Keys.loginAccessToken, loginResonse.value.data?.accessToken ?? "");
        box.write(Keys.loginRefreshToken,
            loginResonse.value.data?.refreshToken ?? "");
        box.write(Keys.loginID, loginResonse.value.data?.id ?? "");
        authToken = "Bearer ${loginResonse.value.data!.accessToken}";
        refreshToken = loginResonse.value.data?.refreshToken ?? "";
        userId = loginResonse.value.data?.id ?? "";
        Future.delayed(800.milliseconds, () {
          isLoading.value = false;
          Get.toNamed(Routes.BREATHING_ONE);
        });
      } else {
        isLoading.value = false;
        errorMessage.value = loginResonse.value.message ?? "Error Message";
      }
    } catch (e) {
      isLoading.value = false;

      debugPrint("error  $e");
    }
  }
}

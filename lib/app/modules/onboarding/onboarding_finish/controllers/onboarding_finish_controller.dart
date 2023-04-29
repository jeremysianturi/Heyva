import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heyva/app/modules/login/model/login_model.dart';
import 'package:heyva/app/modules/profile/model/notification_update_model.dart';
import 'package:heyva/app/modules/profile/model/notification_update_post_model.dart';
import 'package:heyva/app/modules/profile/provider/profile_provider.dart';
import 'package:heyva/app/modules/register/model/register_storage_model.dart';
import 'package:heyva/app/routes/app_pages.dart';
import 'package:heyva/constant/keys.dart';
import 'package:heyva/constant/variabels.dart';
import 'package:heyva/services/dio_services.dart';

import '../../../login/provider/login_provider.dart';

class OnboardingFinishController extends GetxController {
  var isLoading = false.obs;
  late RefreshDioClient _client;
  late DioClient _dioClient;
  late LoginProvider _provider;
  late ProfileProvider _profileProvider;
  var errorMessage = ''.obs;
  var box = GetStorage();
  dynamic argumentData = Get.arguments;
  var notifIsAgree = <bool>[];
  var notifTermPivacy = <String>[];

  String get username {
    var boxData = box.read(Keys.registStorage) as RegisterStorageModel;
    return boxData.fullName;
  }

  @override
  void onInit() {
    _client = RefreshDioClient();
    _dioClient = DioClient();
    _provider = LoginProvider(_client.init());

    notifIsAgree = argumentData[Keys.updatedNotificationArgumentsIsAgree];
    notifTermPivacy =
        argumentData[Keys.updatedNotificationArgumentsTermPrivacy];

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
        Future.delayed(100.milliseconds, () {
          _profileProvider = ProfileProvider(_dioClient.init());
        });
        Future.delayed(300.milliseconds, () {
          var json = NotificationUpdatePostModel(
              termsPrivacy: notifTermPivacy, isAgree: notifIsAgree);
          updateNotif(data: json.toJson());
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

  var updateNotifModel =
      NotificationUpdateModel(success: "", data: null, message: "", error: "")
          .obs;

  updateNotif({required data}) async {
    debugPrint("json $data");
    errorMessage.value = "";
    isLoading.value = true;
    try {
      updateNotifModel.value =
          (await _profileProvider.updatedNotif(json: data))!;
      isLoading.value = false;
      if (updateNotifModel.value.success == "Success") {
        Future.delayed(800.milliseconds, () {
          isLoading.value = false;
          Get.toNamed(Routes.BREATHING_EXERCISE);
        });
      } else {
        errorMessage.value = updateNotifModel.value.message ?? "Error Message";
      }
    } catch (e) {
      isLoading.value = false;
      debugPrint("error  $e");
    }
  }
}

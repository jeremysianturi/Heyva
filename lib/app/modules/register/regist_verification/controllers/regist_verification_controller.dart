import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heyva/app/modules/login/model/login_model.dart';
import 'package:heyva/app/modules/login/provider/login_provider.dart';
import 'package:heyva/app/modules/register/model/register_storage_model.dart';
import 'package:heyva/app/modules/register/model/verified_model.dart';
import 'package:heyva/app/modules/register/provider/register_provider.dart';
import 'package:heyva/app/routes/app_pages.dart';
import 'package:heyva/constant/keys.dart';
import 'package:heyva/constant/strings.dart';
import 'package:heyva/constant/variabels.dart';
import 'package:heyva/services/dio_services.dart';

class RegistVerificationController extends GetxController {
  var box = GetStorage();
  var errorMessage = ''.obs;
  var isLoading = false.obs;
  late RefreshDioClient _client;
  late RegisterProvider _registerProvider;
  late LoginProvider _loginProvider;

  var boxData = RegisterStorageModel(
          email: "",
          password: "",
          fullName: "",
          birthDate: "",
          pregnancyStatus: "",
          interests: [],
          childBirthDate: "",
          estimateDueDate: "")
      .obs;

  @override
  void onInit() {
    _client = RefreshDioClient();
    _registerProvider = RegisterProvider(_client.init());
    _loginProvider = LoginProvider(_client.init());
    boxData.value = box.read(Keys.registStorage) as RegisterStorageModel;
  }

  var checkVeriviedResonse =
      VerifiedModel(success: "Failed", data: null, message: "", error: "").obs;

  String get buttonTitle {
    var data = checkVeriviedResonse.value;
    if (data.success == "Success") {
      return Strings.continue_text;
    } else {
      return Strings.opemMailApps;
    }
  }

  bool get isVerified {
    var data = checkVeriviedResonse.value;
    debugPrint("response isverified ${data.success}");
    debugPrint(
        "response isverified ${checkVeriviedResonse.value.success.toString()}");
    if (data.success == "Success") {
      return true;
    } else {
      return false;
    }
  }

  cekVerified() async {
    isLoading.value = true;
    try {
      checkVeriviedResonse.value = (await _registerProvider.cekVerified(
        email: boxData.value.email,
      ))!;
      debugPrint(
          "response isverified bawah ${checkVeriviedResonse.value.success.toString()}");

      if (checkVeriviedResonse.value.success == "Success") {
        Future.delayed(1.seconds, () async {
          isLoading.value = false;
        });
      } else {
        isLoading.value = false;
      }
    } catch (e) {
      isLoading.value = false;
      debugPrint("error  $e");
    }
  }

  var loginResonse =
      LoginModel(success: "", data: null, message: "", error: "").obs;

  postLogin() async {
    isLoading.value = true;
    try {
      var boxData = box.read(Keys.registStorage) as RegisterStorageModel;

      loginResonse.value = (await _loginProvider.Login(
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
        Get.toNamed(Routes.TURNON_NOTIF);
      } else {
        isLoading.value = false;
      }
    } catch (e) {
      isLoading.value = false;

      debugPrint("error  $e");
    }
  }
}

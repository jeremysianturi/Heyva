import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heyva/app/modules/login/model/login_model.dart';
import 'package:heyva/app/modules/login/provider/login_provider.dart';
import 'package:heyva/app/routes/app_pages.dart';
import 'package:heyva/constant/keys.dart';
import 'package:heyva/constant/strings.dart';
import 'package:heyva/constant/variabels.dart';
import 'package:heyva/services/dio_services.dart';

class LoginController extends GetxController {
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();
  RxBool isObscure = true.obs;

  var isLoading = false.obs;
  late RefreshDioClient _client;
  late RefreshDioClient _clientRefresh;
  late LoginProvider _provider;
  late LoginProvider _refreshprovider;
  var errorMessage = ''.obs;
  var isEmailError = false.obs;
  var isPasserror = false.obs;
  var box = GetStorage();

  @override
  void onInit() {
    _client = RefreshDioClient();
    _clientRefresh = RefreshDioClient();
    _provider = LoginProvider(_client.init());
    _refreshprovider = LoginProvider(_clientRefresh.init());
    emailC.text = "howosa9215@larland.com";
    passC.text = "minimal88";
    super.onInit();
  }

  bool get validateData {
    isEmailError.value = false;
    isPasserror.value = false;
    errorMessage.value = "";
    if (emailC.text.isEmpty) {
      isEmailError.value = true;
      errorMessage.value = Strings.emptyForm;
      return false;
    }
    if (passC.text.isEmpty) {
      isPasserror.value = true;
      errorMessage.value = Strings.emptyForm;
      return false;
    }
    if (!GetUtils.isEmail(emailC.text)) {
      isEmailError.value = true;
      errorMessage.value = Strings.invalidEmail;
      return false;
    }
    return true;
  }

  var loginResonse =
      LoginModel(success: "", data: null, message: "", error: "").obs;

  postLogin() async {
    errorMessage.value = "";
    isLoading.value = true;
    try {
      loginResonse.value =
          (await _provider.Login(username: emailC.text, password: passC.text))!;
      isLoading.value = false;

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
        Future.delayed(800.milliseconds);
        Get.toNamed(Routes.BREATHING_EXERCISE);
        // Get.toNamed(Routes.TURNON_NOTIF);
      } else {
        if (loginResonse.value.message
            .toString()
            .toLowerCase()
            .contains("pass")) {
          isPasserror.value = true;
        } else {
          isEmailError.value = true;
          isPasserror.value = true;
        }
        errorMessage.value = loginResonse.value.message ?? "Error Message";
      }
    } catch (e) {
      isLoading.value = false;

      debugPrint("error  $e");
    }
  }

  var response =
      LoginModel(success: "", data: null, message: "", error: "").obs;

  refresh() async {
    errorMessage.value = "";
    isLoading.value = true;
    var userId = box.read(Keys.loginID);
    var refres = box.read(Keys.loginRefreshToken);
    box.write(Keys.loginAccessToken, "");
    isRefresh = true;
    Future.delayed(800.milliseconds);
    try {
      response.value = (await _refreshprovider.refreshToken(
          refreshToken: refres, userId: userId))!;
      isLoading.value = false;

      if (response.value.success == "Success") {
        debugPrint("refresh cusess -----------------------");
        Future.delayed(800.milliseconds);
        debugPrint("old token ${box.read(Keys.loginAccessToken)}");
        box.write(
            Keys.loginAccessToken, response.value.data?.accessToken ?? "");
        box.write(
            Keys.loginRefreshToken, response.value.data?.refreshToken ?? "");
        box.write(Keys.loginID, response.value.data?.id ?? "");
        authToken = "Bearer ${response.value.data?.accessToken}";
        refreshToken = response.value.data?.refreshToken ?? "";
        userId = response.value.data?.id ?? "";
        onInit();
        debugPrint("new token ${box.read(Keys.loginAccessToken)}");
      } else {
        errorMessage.value = response.value.message ?? "Error Message";
      }
    } catch (e) {
      isLoading.value = false;

      debugPrint("error  $e");
    }
  }

  @override
  void onClose() {
    emailC.dispose();
    passC.dispose();
    super.onClose();
  }
}

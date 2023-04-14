import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heyva/app/modules/reset_password/model/reset_password_model.dart';
import 'package:heyva/app/modules/reset_password/provider/reset_password_provider.dart';
import 'package:heyva/app/routes/app_pages.dart';
import 'package:heyva/constant/keys.dart';
import 'package:heyva/constant/strings.dart';
import 'package:heyva/services/dio_services.dart';

class ResetPasswordController extends GetxController {
  TextEditingController emailC = TextEditingController();
  var isEmailError = false.obs;

  var isLoading = false.obs;
  late RefreshDioClient _clientRefresh;
  late ResetPasswordProvider _resetPasswordProvider;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    _clientRefresh = RefreshDioClient();
    _resetPasswordProvider = ResetPasswordProvider(_clientRefresh.init());
    super.onInit();
  }

  bool get validateData {
    isEmailError.value = false;
    errorMessage.value = "";
    if (emailC.text.isEmpty) {
      isEmailError.value = true;
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

  var resetPasswordResponse =
      ResetPasswordModel(success: "", data: null, message: "", error: "").obs;

  postResetPassword() async {
    errorMessage.value = "";
    isLoading.value = true;
    try {
      resetPasswordResponse.value =
      (await _resetPasswordProvider.postResetPassword(email: emailC.text))!;
      isLoading.value = false;

      if (resetPasswordResponse.value.success == "Success") {
        Get.toNamed(Routes.RESET_PASSWORD_VERIFICATION, arguments: {
          Keys.resetPasswordEmail: emailC.text
        });
      } else {
        errorMessage.value =
            resetPasswordResponse.value.message ?? "Error Message";
      }
    } catch (e) {
      isLoading.value = false;

      debugPrint("error  $e");
    }
  }
}


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heyva/app/modules/profile/model/change_password_model.dart';
import 'package:heyva/app/modules/profile/provider/profile_provider.dart';
import 'package:heyva/app/widgets/reusable_bottomSheet_message.dart';
import 'package:heyva/constant/strings.dart';
import 'package:heyva/services/dio_services.dart';

class ChangePasswordController extends GetxController {
  TextEditingController oldPassC = TextEditingController();
  TextEditingController pass1C = TextEditingController();
  TextEditingController pass2C = TextEditingController();
  RxBool isObscureOld = true.obs;
  RxBool isObscure1 = true.obs;
  RxBool isObscure2 = true.obs;

  var errorMessage = "".obs;
  var isLoading = false.obs;
  late DioClient _client;
  late ProfileProvider _profileProvider;
  var box = GetStorage();

  @override
  void onInit() {
    _client = DioClient();
    _profileProvider = ProfileProvider(_client.init());
    super.onInit();
  }

  bool get validation {
    errorMessage.value = "";
    if (oldPassC.text.isEmpty || pass1C.text.isEmpty || pass2C.text.isEmpty) {
      errorMessage.value = Strings.emptyForm;
      return false;
    } else if (pass1C.text.length < 8 || pass2C.text.length < 8) {
      errorMessage.value = Strings.atLeast8Char;
      return false;
    } else if (pass1C.text != pass2C.text) {
      errorMessage.value = "Password combinations don't match";
      return false;
    } else {
      return true;
    }
  }

  var changePasswordResponse =
      ChangePasswordModel(success: "", data: null, message: "", error: "").obs;

  postChangePassword() async {
    errorMessage.value = "";
    isLoading.value = true;
    try {
      changePasswordResponse.value = (await _profileProvider.changePassword(
          oldPassword: oldPassC.text,
          newPassword: pass1C.text,
          confPassword: pass2C.text))!;
      isLoading.value = false;

      if (changePasswordResponse.value.success == "Success") {
        bottomSheetMessage(color: "green", desc: "change password Success");
        Future.delayed(2.seconds, () {
          Get.back();
          Get.back();
        });
      } else {
        errorMessage.value =
            changePasswordResponse.value.message ?? "Error Message";
      }
    } catch (e) {
      isLoading.value = false;
      debugPrint("error  $e");
    }
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heyva/constant/strings.dart';

class ResetPasswordInputController extends GetxController {

  TextEditingController pass1C = TextEditingController();
  TextEditingController pass2C = TextEditingController();
  RxBool isObscureOld = true.obs;
  RxBool isObscure1 = true.obs;
  RxBool isObscure2 = true.obs;

  var errorMessage = "".obs;

  var isLoading = false.obs;

  bool get validation {
    errorMessage.value = "";
    if ( pass1C.text.isEmpty || pass2C.text.isEmpty) {
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
}

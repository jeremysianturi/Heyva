import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {

  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();
  RxBool isObscure = false.obs;

  @override
  void onClose() {
    emailC.dispose();
    passC.dispose();
    super.onClose();
  }
}
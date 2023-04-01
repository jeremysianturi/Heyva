import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController {
  TextEditingController pass1C = TextEditingController();
  TextEditingController pass2C = TextEditingController();
  RxBool isObscure1 = true.obs;
  RxBool isObscure2 = true.obs;

  var errorMessage = "".obs;
}


import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SignUpController extends GetxController {

  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();

  @override
  void onClose() {
    emailC.dispose();
    passC.dispose();
    super.onClose();
  }

  @override
  void onReady() {
    // TODO: implement onReady

    super.onReady();
  }
}
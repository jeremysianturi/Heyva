import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class BreathingTwoController extends GetxController {

  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();

  @override
  void onClose() {
    emailC.dispose();
    passC.dispose();
    super.onClose();
  }
}
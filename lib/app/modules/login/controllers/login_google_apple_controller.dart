import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class LoginGoogleAppleController extends GetxController {

  TextEditingController name = TextEditingController();

  @override
  void onClose() {
    name.dispose();
    super.onClose();
  }
}
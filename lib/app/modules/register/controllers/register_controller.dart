import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class RegisterController extends GetxController {

  TextEditingController fullname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  RxBool isObscure = false.obs;

  @override
  void onClose() {
    fullname.dispose();
    email.dispose();
    pass.dispose();
    super.onClose();
  }
}
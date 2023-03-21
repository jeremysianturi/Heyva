
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heyva/app/routes/app_pages.dart';
import 'package:heyva/constant/keys.dart';
import 'package:heyva/constant/variabels.dart';

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

  void savedData(){
    var box = GetStorage();
    authToken = box.read(Keys.loginAccessToken).toString();
    refreshToken = box.read(Keys.loginRefreshToken).toString();
    debugPrint("auth token $authToken");
    if (authToken.isNotEmpty && refreshToken.isNotEmpty) {
      Future.delayed(1000.milliseconds);
      Get.toNamed(Routes.BREATHING_ONE);
    }
  }
}
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:heyva/app/modules/breathing/breathingone/views/breathing_one_view.dart';
import 'package:heyva/app/modules/login/model/login_model.dart';
import 'package:heyva/app/modules/login/provider/login_provider.dart';
import 'package:heyva/app/widgets/reusable_bottomSheet_message.dart';
import 'package:heyva/services/dio_services.dart';

class LoginController extends GetxController {
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();
  RxBool isObscure = false.obs;

  var isLoading = false.obs;
  late DioClient _client;
  late LoginProvider _provider;

  @override
  void onInit() {
    _client = DioClient();
    _provider = LoginProvider(_client.init());
    super.onInit();
  }

  var loginResonse =
      LoginModel(success: "", data: null, message: "", error: "").obs;

  postLogin() async {
    isLoading.value = true;
    try {
      loginResonse.value =
          (await _provider.Login(username: emailC.text, password: passC.text))!;
      isLoading.value = false;

      if (loginResonse.value.success == "Success") {
        Get.to(BreathingOneView());
      } else {
        bottomSheetMessage(
            color: "red", desc: loginResonse.value.message ?? "");
      }
    } catch (e) {
      isLoading.value = false;

      debugPrint("error  $e");
    }
  }

  @override
  void onClose() {
    emailC.dispose();
    passC.dispose();
    super.onClose();
  }
}

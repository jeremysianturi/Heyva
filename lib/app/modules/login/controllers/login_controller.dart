import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heyva/app/modules/breathing/breathingone/views/breathing_one_view.dart';
import 'package:heyva/app/modules/login/model/login_model.dart';
import 'package:heyva/app/modules/login/provider/login_provider.dart';
import 'package:heyva/app/routes/app_pages.dart';
import 'package:heyva/app/widgets/reusable_bottomSheet_message.dart';
import 'package:heyva/constant/keys.dart';
import 'package:heyva/constant/strings.dart';
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

  bool get validateData {
    if (emailC.text.isEmpty || passC.text.isEmpty) {
      bottomSheetMessage(desc: Strings.emptyForm);
      return false;
    } else if (!GetUtils.isEmail(emailC.text)) {
      bottomSheetMessage(desc: Strings.invalidEmail);
      return false;
    }
    return true;
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
        var box = GetStorage();
        box.write(
            Keys.loginAccessToken, loginResonse.value.data?.accessToken ?? "");
        box.write(Keys.loginRefreshToken,
            loginResonse.value.data?.refreshToken ?? "");
        800.milliseconds;
        Get.toNamed(Routes.BREATHING_ONE);
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

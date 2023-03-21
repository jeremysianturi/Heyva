import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heyva/app/modules/register/model/register_storage_model.dart';
import 'package:heyva/app/routes/app_pages.dart';
import 'package:heyva/app/widgets/reusable_bottomSheet_message.dart';
import 'package:heyva/constant/keys.dart';
import 'package:heyva/constant/strings.dart';

class RegisterController extends GetxController {
  TextEditingController fullname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  RxBool isObscure = true.obs;
  final box = GetStorage();

  saveToStorage() {
    if (validateData) {
      var data = RegisterStorageModel(
          email: email.text,
          password: pass.text,
          fullName: fullname.text,
          birthDate: "",
          pregnancyStatus: "",
          interests: []);
      box.write(Keys.registStorage, data);
      debugPrint("read data ${box.read(Keys.registStorage)}");
      800.seconds;
      Get.toNamed(Routes.ONBOARDING_ONE,
          arguments: {Keys.fullNameArguments: fullname.text});
      // Get.to(OnBoardingOneView());
    }
  }

  bool get validateData {
    if (email.text.isEmpty || pass.text.isEmpty || fullname.text.isEmpty) {
      bottomSheetMessage(desc: Strings.emptyForm);
      return false;
    } else if (!GetUtils.isEmail(email.text)) {
      bottomSheetMessage(desc: Strings.invalidEmail);
      return false;
    }
    return true;
  }

  @override
  void onClose() {
    fullname.dispose();
    email.dispose();
    pass.dispose();
    super.onClose();
  }
}

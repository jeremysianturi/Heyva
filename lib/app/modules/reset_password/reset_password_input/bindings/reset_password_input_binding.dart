import 'package:get/get.dart';

import '../controllers/reset_password_input_controller.dart';

class ResetPasswordInputBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResetPasswordInputController>(
      () => ResetPasswordInputController(),
    );
  }
}

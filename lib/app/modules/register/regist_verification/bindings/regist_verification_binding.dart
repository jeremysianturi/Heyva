import 'package:get/get.dart';

import '../controllers/regist_verification_controller.dart';

class RegistVerificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegistVerificationController>(
      () => RegistVerificationController(),
    );
  }
}

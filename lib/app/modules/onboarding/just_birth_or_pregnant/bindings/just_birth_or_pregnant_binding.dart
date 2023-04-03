import 'package:get/get.dart';

import '../controllers/just_birth_or_pregnant_controller.dart';

class JustBirthOrPregnantBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JustBirthOrPregnantController>(
      () => JustBirthOrPregnantController(),
    );
  }
}

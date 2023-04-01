import 'package:get/get.dart';

import '../controllers/breathing_feelings_controller.dart';

class BreathingFeelingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BreathingFeelingsController>(
      () => BreathingFeelingsController(),
    );
  }
}

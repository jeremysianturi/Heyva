import 'package:get/get.dart';

import '../controllers/breathing_finish_controller.dart';

class BreathingFinishBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BreathingFinishController>(
          () => BreathingFinishController(),
    );
  }
}
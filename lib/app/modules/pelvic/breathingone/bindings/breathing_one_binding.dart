import 'package:get/get.dart';

import '../controllers/breathing_one_controller.dart';

class BreathingOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BreathingOneController>(
          () => BreathingOneController(),
    );
  }
}
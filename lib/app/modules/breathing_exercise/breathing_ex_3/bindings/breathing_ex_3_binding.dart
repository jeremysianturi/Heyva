import 'package:get/get.dart';

import '../controllers/breathing_ex_3_controller.dart';

class BreathingEx3Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BreathingEx3Controller>(
      () => BreathingEx3Controller(),
    );
  }
}

import 'package:get/get.dart';

import '../controllers/breathing_ex_2_controller.dart';

class BreathingEx2Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BreathingEx2Controller>(
      () => BreathingEx2Controller(),
    );
  }
}

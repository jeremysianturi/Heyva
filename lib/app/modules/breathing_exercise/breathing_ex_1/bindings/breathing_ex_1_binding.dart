import 'package:get/get.dart';

import '../controllers/breathing_ex_1_controller.dart';

class BreathingEx1Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BreathingEx1Controller>(
      () => BreathingEx1Controller(),
    );
  }
}

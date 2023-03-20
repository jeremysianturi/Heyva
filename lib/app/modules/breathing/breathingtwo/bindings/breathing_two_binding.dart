import 'package:get/get.dart';
import '../controllers/breathing_two_controller.dart';

class BreathingTwoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BreathingTwoController>(
          () => BreathingTwoController(),
    );
  }
}
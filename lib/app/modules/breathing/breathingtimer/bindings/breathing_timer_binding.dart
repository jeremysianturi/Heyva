import 'package:get/get.dart';
import '../controllers/breathing_timer_controller.dart';

class BreathingTimerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BreathingTimerController>(
          () => BreathingTimerController(),
    );
  }
}
import 'package:get/get.dart';

import '../controllers/breathing_exercise_controller.dart';

class BreathingExerciseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BreathingExerciseController>(
      () => BreathingExerciseController(),
    );
  }
}

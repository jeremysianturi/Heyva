import 'package:get/get.dart';

import '../controllers/mood_tracker_form_controller.dart';

class MoodTrackerFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MoodTrackerFormController>(
      () => MoodTrackerFormController(),
    );
  }
}

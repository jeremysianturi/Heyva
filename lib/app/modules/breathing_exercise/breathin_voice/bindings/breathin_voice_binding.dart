import 'package:get/get.dart';

import '../controllers/breathin_voice_controller.dart';

class BreathinVoiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BreathinVoiceController>(
      () => BreathinVoiceController(),
    );
  }
}

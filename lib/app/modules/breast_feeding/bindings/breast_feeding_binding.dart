import 'package:get/get.dart';

import '../controllers/breast_feeding_controller.dart';

class BreastFeedingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BreastFeedingController>(
      () => BreastFeedingController(),
    );
  }
}

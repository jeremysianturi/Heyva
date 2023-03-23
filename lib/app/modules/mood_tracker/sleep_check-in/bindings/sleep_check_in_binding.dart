import 'package:get/get.dart';

import '../controllers/sleep_check_in_controller.dart';

class SleepCheckInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SleepCheckInController>(
      () => SleepCheckInController(),
    );
  }
}

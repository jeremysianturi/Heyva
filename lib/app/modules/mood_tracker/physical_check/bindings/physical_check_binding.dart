import 'package:get/get.dart';

import '../controllers/physical_check_controller.dart';

class PhysicalCheckBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PhysicalCheckController>(
      () => PhysicalCheckController(),
    );
  }
}

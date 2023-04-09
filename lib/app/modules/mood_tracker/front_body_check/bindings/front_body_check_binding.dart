import 'package:get/get.dart';

import '../controllers/front_body_check_controller.dart';

class FrontBodyCheckBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FrontBodyCheckController>(
      () => FrontBodyCheckController(),
    );
  }
}

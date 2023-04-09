import 'package:get/get.dart';

import '../controllers/back_body_check_controller.dart';

class BackBodyCheckBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BackBodyCheckController>(
      () => BackBodyCheckController(),
    );
  }
}

import 'package:get/get.dart';

import '../controllers/notification_center_controller.dart';

class NotificationCenterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotificationCenterController>(
      () => NotificationCenterController(),
    );
  }
}

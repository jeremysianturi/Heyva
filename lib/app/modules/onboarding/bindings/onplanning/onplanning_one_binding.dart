import 'package:get/get.dart';

import '../../controllers/onplanning/onplanning_one_controller.dart';

class OnPlanningOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnPlanningOneController>(
          () => OnPlanningOneController(),
    );
  }
}
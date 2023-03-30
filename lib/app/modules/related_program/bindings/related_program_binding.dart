import 'package:get/get.dart';

import '../controllers/related_program_controller.dart';

class RelatedProgramBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RelatedProgramController>(
      () => RelatedProgramController(),
    );
  }
}

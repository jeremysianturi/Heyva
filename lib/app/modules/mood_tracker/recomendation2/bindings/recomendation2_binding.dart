import 'package:get/get.dart';

import '../controllers/recomendation2_controller.dart';

class Recomendation2Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Recomendation2Controller>(
      () => Recomendation2Controller(),
    );
  }
}

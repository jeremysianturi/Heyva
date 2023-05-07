import 'package:get/get.dart';

import '../controllers/in_app_web_view_controller.dart';

class InAppWebViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InAppWebViewController>(
      () => InAppWebViewController(),
    );
  }
}

import 'package:get/get.dart';
import 'package:heyva/app/modules/login/controllers/login_google_apple_controller.dart';

class LoginGoogleAppleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginGoogleAppleController>(
          () => LoginGoogleAppleController(),
    );
  }
}
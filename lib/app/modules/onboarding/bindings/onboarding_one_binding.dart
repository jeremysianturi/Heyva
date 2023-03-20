import 'package:get/get.dart';
import '../controllers/onboarding_one_controller.dart';

class OnBoardingOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnBoardingOneController>(
          () => OnBoardingOneController(),
    );
  }
}
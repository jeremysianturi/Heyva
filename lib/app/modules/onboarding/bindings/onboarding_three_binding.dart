import 'package:get/get.dart';
import '../controllers/onboarding_three_controller.dart';

class OnBoardingThreeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnBoardingThreeController>(
          () => OnBoardingThreeController(),
    );
  }
}
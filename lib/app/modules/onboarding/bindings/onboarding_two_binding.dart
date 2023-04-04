import 'package:get/get.dart';

import '../controllers/onboarding_two_controller.dart';

class OnBoardingTwoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnBoardingTwoController>(
          () => OnBoardingTwoController(),
    );
  }
}
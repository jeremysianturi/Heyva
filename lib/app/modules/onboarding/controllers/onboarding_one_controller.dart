import 'package:get/get.dart';
import 'package:heyva/constant/keys.dart';

class OnBoardingOneController extends GetxController {
  dynamic argumentData = Get.arguments;

  String get fullName {
    if (argumentData[Keys.fullNameArguments]
        .toString()
        .isNotEmpty) {
      return argumentData[Keys.fullNameArguments].toString();
    }
    return '';
  }
}

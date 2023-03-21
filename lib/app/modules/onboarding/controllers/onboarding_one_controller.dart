import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
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

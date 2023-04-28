import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heyva/app/modules/learn/provider/learn_provider.dart';
import 'package:heyva/app/widgets/nav_screen.dart';
import 'package:heyva/constant/keys.dart';
import 'package:heyva/services/dio_services.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class BreathingFinishController extends GetxController {
  var box = GetStorage();

  String get pelvic6 {
    return box.read(Keys.pelvic1Storage);
  }

  var isLoading = false.obs;
  late DioClient _client;
  late LearnProvider _learnProvider;
  var errorMessage = ''.obs;
  var isEmailError = false.obs;
  var isPasserror = false.obs;
  dynamic argumentData = Get.arguments;

  @override
  void onInit() {
    _client = DioClient();
    _learnProvider = LearnProvider(_client.init());

    super.onInit();
  }

  programPersonalTrackerFinish({required programId}) async {
    errorMessage.value = "";
    isLoading.value = true;
    try {
      var data = (await _learnProvider.programPersonalTrackerFinish(
          programId: programId))!;
      isLoading.value = false;
      if (data.success == "Success") {
        box.remove(Keys.programIdChildStorage);
        box.remove(Keys.programIdStorage);
        Get.deleteAll();
        pushNewScreen(
          Get.context!,
          screen: NavScreen(
            menuScreenContext: Get.context!,
          ),
        );
      } else {}
    } catch (e) {
      isLoading.value = false;
      debugPrint("error  $e");
    }
  }
}

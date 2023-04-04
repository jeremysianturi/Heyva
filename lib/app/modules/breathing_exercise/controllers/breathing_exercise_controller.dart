import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heyva/app/modules/breathing_exercise/model/breathing_model.dart';
import 'package:heyva/app/modules/breathing_exercise/provider/breathing_provider.dart';
import 'package:heyva/app/routes/app_pages.dart';
import 'package:heyva/constant/keys.dart';
import 'package:heyva/services/dio_services.dart';

class BreathingExerciseController extends GetxController {
  var isLoading = false.obs;
  late DioClient _client;
  late BreathingProvider _provider;
  var errorMessage = ''.obs;
  var isEmailError = false.obs;
  var isPasserror = false.obs;

  @override
  void onInit() {
    _client = DioClient();
    _provider = BreathingProvider(_client.init());
    super.onInit();
  }

  var breathingResonse =
      BreathingModel(success: "", data: null, message: "", error: "").obs;

  getBreathing() async {
    errorMessage.value = "";
    isLoading.value = true;
    try {
      breathingResonse.value = (await _provider.getBreathingProgram())!;
      isLoading.value = false;

      if (breathingResonse.value.success == "Success") {
        var box = GetStorage();
        var data = breathingResonse.value.data?.child?[0].programDetail;
        box.write(Keys.breathing1Storage, data?[0].textContent);
        box.write(Keys.breathing2Storage, data?[1].textContent);
        Future.delayed(800.milliseconds);
        Get.toNamed(Routes.BREATHIN_VOICE);
      } else {
        errorMessage.value = breathingResonse.value.message ?? "Error Message";
      }
    } catch (e) {
      isLoading.value = false;

      debugPrint("error  $e");
    }
  }
}

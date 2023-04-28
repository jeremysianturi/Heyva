import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heyva/app/modules/breathing_exercise/model/breathing_model.dart';
import 'package:heyva/app/modules/breathing_exercise/provider/breathing_provider.dart';
import 'package:heyva/app/modules/learn/model/program_list_model.dart';
import 'package:heyva/app/modules/learn/provider/learn_provider.dart';
import 'package:heyva/app/routes/app_pages.dart';
import 'package:heyva/constant/keys.dart';
import 'package:heyva/services/dio_services.dart';

class BreathingExerciseController extends GetxController {
  var isLoading = false.obs;
  late DioClient _client;
  late BreathingProvider _provider;
  late LearnProvider _learnProvider;
  var errorMessage = ''.obs;
  var isEmailError = false.obs;
  var isPasserror = false.obs;
  var box = GetStorage();
  dynamic argumentData = Get.arguments;

  @override
  void onInit() {
    _client = DioClient();
    _provider = BreathingProvider(_client.init());
    _learnProvider = LearnProvider(_client.init());
    initData();
    super.onInit();
  }

  initData() {
    if (box.read(Keys.programIdStorage).toString() == "null") {
      Future.delayed(300.milliseconds, () {
        getProgram();
      });
    } else {
      createProgramPersonal(programId: box.read(Keys.programIdStorage));
    }
  }

  var breathingResonse =
      BreathingModel(success: "", data: null, message: "", error: "").obs;

  createProgramPersonal({required programId}) async {
    errorMessage.value = "";
    isLoading.value = true;
    try {
      var data =
          (await _learnProvider.programPersonalCreate(programId: programId))!;
      isLoading.value = false;
      if (data.success == "Success") {
      } else {}
    } catch (e) {
      isLoading.value = false;

      debugPrint("error  $e");
    }
  }

  createProgramPersonalTracker(
      {required programId, required programIdChild}) async {
    errorMessage.value = "";
    isLoading.value = true;
    try {
      var data = (await _learnProvider.programPersonalTrackerCreate(
          programId: programId, programIdChild: programIdChild))!;
      isLoading.value = false;

      if (data.success == "Success") {
      } else {}
    } catch (e) {
      isLoading.value = false;

      debugPrint("error  $e");
    }
  }

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

  var programListResponse =
      ProgramListModel(success: "", data: null, message: "", error: "").obs;

  getProgram() async {
    errorMessage.value = "";
    isLoading.value = true;
    try {
      programListResponse.value = (await _learnProvider.getProgramList())!;
      isLoading.value = false;

      if (programListResponse.value.success == "Success") {
        box.write(Keys.programIdStorage, programListResponse.value.data![0].id);
        box.write(Keys.programIdChildStorage,
            programListResponse.value.data![0].child![0].id);
        debugPrint("profram id storage ${box.read(Keys.programIdStorage)}");
        debugPrint(
            "profram id child  storage ${box.read(Keys.programIdChildStorage)}");
        createProgramPersonal(programId: programListResponse.value.data![0].id);
      } else {
        errorMessage.value =
            programListResponse.value.message ?? "Error Message";
      }
    } catch (e) {
      isLoading.value = false;
      debugPrint("error  $e");
    }
  }
}

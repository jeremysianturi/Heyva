import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heyva/app/modules/breathing_exercise/model/breathing_model.dart';
import 'package:heyva/app/modules/breathing_exercise/provider/breathing_provider.dart';
import 'package:heyva/app/modules/learn/model/program_list_model.dart';
import 'package:heyva/app/modules/learn/provider/learn_provider.dart';
import 'package:heyva/app/modules/register/model/register_storage_model.dart';
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

  String get greeting {
    if (box.read(Keys.profileName).toString() != "null") {
      return "Hi ${box.read(Keys.profileName)} 👋🏻";
    } else {
      var data = box.read(Keys.registStorage) as RegisterStorageModel;
      return "Hi ${data.fullName} 👋🏻";
    }
  }

  var imgAsset = "".obs;
  var exercise = "";

  @override
  void onInit() {
    _client = DioClient();
    _provider = BreathingProvider(_client.init());
    _learnProvider = LearnProvider(_client.init());
    initData();

    debugPrint("argumentData[Keys.ardoExercise]${argumentData}");

    box.remove(Keys.breathing1Storage);
    getBreathing();
    super.onInit();
  }

  initData() {
    if (box.read(Keys.programIdStorage).toString() == "null") {
      Future.delayed(300.milliseconds, () {
        getProgram();
      });
    } else {
      exercise = argumentData[Keys.ardoExercise].toString();

      if (exercise == "2") {
        imgAsset.value = "assets/images/breathing_2_img.png";
      } else {
        imgAsset.value = "assets/images/breathing_1_img.png";
      }

      createProgramPersonal(programId: box.read(Keys.programIdStorage));
    }
    // getProgram();
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
        var data = breathingResonse.value.data?.child;
        box.write(Keys.breathing1Storage, data?[0]);
        box.write(Keys.breathing2Storage, data?[1]);
        box.write(Keys.breathing3Storage, data?[2]);
      } else {
        errorMessage.value = breathingResonse.value.message ?? "Error Message";
      }
    } catch (e) {
      isLoading.value = false;

      debugPrint("error  $e");
    }
  }

  String get desc1Breathing {
    var data = breathingResonse.value.data?.child;
    if (exercise == "1") {
      return data?[0].programDetail?[0].textContent ?? "";
    } else if (exercise == "2") {
      return data?[1].programDetail?[0].textContent ?? "";
    } else {
      return data?[2].programDetail?[0].textContent ?? "";
    }
  }

  var programListResponse =
      ProgramListModel(success: "", data: null, message: "", error: "").obs;
  var dailyProg = "";

  getProgram() async {
    errorMessage.value = "";
    isLoading.value = true;
    try {
      programListResponse.value = (await _learnProvider.getProgramList())!;
      isLoading.value = false;

      if (programListResponse.value.success == "Success") {
        /// dijalankna ketika breathing ex dibuka selain dari recovery dan learn
        dailyProg = programListResponse.value.data?[0].dailyProgress ?? "";

        box.write(Keys.programIdStorage, programListResponse.value.data![0].id);

        if (dailyProg == "1/3") {
          imgAsset.value = "assets/images/breathing_2_img.png";
        } else {
          imgAsset.value = "assets/images/breathing_1_img.png";
        }
        if (dailyProg == "0/3") {
          box.write(Keys.programIdChildStorage,
              programListResponse.value.data![0].child![0].id);
          exercise = "1";
        } else if (dailyProg == "1/3") {
          box.write(Keys.programIdChildStorage,
              programListResponse.value.data![0].child![1].id);
          exercise = "2";
        } else {
          box.write(Keys.programIdChildStorage,
              programListResponse.value.data![0].child![2].id);
          exercise = "3";
        }
        box.write(Keys.exerciseOngoing, exercise);

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

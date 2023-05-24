import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heyva/app/modules/learn/model/program_list_model.dart';
import 'package:heyva/app/modules/pelvic/breathingtimer/views/breathing_timer_view.dart';
import 'package:heyva/app/modules/pelvic/model/pelvic_model.dart';
import 'package:heyva/app/modules/pelvic/provider/pelvic_provider.dart';
import 'package:heyva/app/modules/learn/provider/learn_provider.dart';
import 'package:heyva/constant/keys.dart';
import 'package:heyva/services/dio_services.dart';

class BreathingOneController extends GetxController {
  var isLoading = false.obs;
  late DioClient _client;
  late PelvicProvider _provider;
  late LearnProvider _learnProvider;
  var errorMessage = ''.obs;
  var isEmailError = false.obs;
  var isPasserror = false.obs;
  var box = GetStorage();

  @override
  void onInit() {
    _client = DioClient();
    _provider = PelvicProvider(_client.init());
    _learnProvider = LearnProvider(_client.init());
    initData();
    super.onInit();
  }

  initData() {
    getProgram();
    // createProgramPersonal(programId: box.read(Keys.programIdStorage));
  }

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

  createProgramPersonalTracker({required programId}) async {
    errorMessage.value = "";
    isLoading.value = true;
    try {
      var data = (await _learnProvider.programPersonalTrackerCreate(
          programId: programId, programIdChild: ""))!;
      isLoading.value = false;
      if (data.success == "Success") {

      } else {}
      Future.delayed(200.milliseconds, () {
        getPelvic();
      });
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
        box.write(Keys.programIdStorage, programListResponse.value.data![1].id);
        box.write(
            Keys.programIdChildStorage, programListResponse.value.data![1].id);

        createProgramPersonal(programId: programListResponse.value.data![1].id);
      } else {
        errorMessage.value =
            programListResponse.value.message ?? "Error Message";
      }
    } catch (e) {
      isLoading.value = false;
      debugPrint("error  $e");
    }
  }

  var pelvicResponse =
      PelvicModel(success: "", data: null, message: "", error: "").obs;

  getPelvic() async {
    errorMessage.value = "";
    isLoading.value = true;
    try {
      pelvicResponse.value = (await _provider.getPelvic(
          pelvicID: box.read(Keys.programIdStorage)))!;
      isLoading.value = false;

      if (pelvicResponse.value.success == "Success") {
        var data = pelvicResponse.value.data;
        var box = GetStorage();
        box.write(Keys.pelvic1Storage, data?.programDetail?[0].textContent);
        box.write(Keys.pelvic2Storage, data?.programDetail?[1].textContent);
        box.write(Keys.pelvic3Storage, data?.programDetail?[2].textContent);
        box.write(Keys.pelvic4Storage, data?.programDetail?[3].textContent);
        box.write(Keys.pelvic5Storage, data?.programDetail?[4].textContent);
        box.write(Keys.pelvic6Storage, data?.programDetail?[5].textContent);
        Future.delayed(400.milliseconds);
        // Get.to(const BreathingTwoView());
        Get.to(const BreathingTimerView());
      } else {
        errorMessage.value = pelvicResponse.value.message ?? "Error Message";
      }
    } catch (e) {
      isLoading.value = false;
      debugPrint("error  $e");
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}

import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heyva/app/modules/mood_tracker/mood_tracker_form/model/tracker_type_mood_model.dart'
    as mood;
import 'package:heyva/app/modules/mood_tracker/mood_tracker_form/provider/mood_tracker_provider.dart';
import 'package:heyva/app/modules/mood_tracker/physical_check/model/tracker_type_physical_model.dart';
import 'package:heyva/app/modules/mood_tracker/physical_check/provider/physical_provider.dart';
import 'package:heyva/app/modules/mood_tracker/recomendation/model/recomendation_model.dart'
    as recom;
import 'package:heyva/app/modules/mood_tracker/recomendation/provider/recomendation_provider.dart';
import 'package:heyva/app/modules/mood_tracker/sleep_check-in/model/tracker_type_sleep_model.dart'
    as sleep;
import 'package:heyva/app/modules/mood_tracker/sleep_check-in/provider/sleep_tracker_provider.dart';
import 'package:heyva/app/routes/app_pages.dart';
import 'package:heyva/constant/keys.dart';
import 'package:heyva/services/dio_services.dart';

class PhysicalCheckController extends GetxController {
  var pagePosition = 0.obs;
  var currentIndex = 0.obs;
  var otherC = TextEditingController();
  var carouselC = CarouselController();

  var isLoading = false.obs;
  late DioClient _client;
  late PhysicalProvider _physicalProvider;
  late MoodTrackerProvider _moodTrackerProvider;
  late SleepTrackerProvider _sleepTrackerProvider;
  late RecomendationProvider _recomendationProvider;
  var errorMessage = ''.obs;
  var box = GetStorage();

  @override
  void onInit() {
    _client = DioClient();
    _physicalProvider = PhysicalProvider(_client.init());
    _moodTrackerProvider = MoodTrackerProvider(_client.init());
    _sleepTrackerProvider = SleepTrackerProvider(_client.init());
    _recomendationProvider = RecomendationProvider(_client.init());
    debugPrint("init");
    initData();
    super.onInit();
  }

  initData() async {
    errorMessage.value = "";
    isLoading.value = true;
    try {
      var response = await Future.wait([
        _physicalProvider.getTrackerPhysical(),
        _moodTrackerProvider.getTrackerMood(),
        _sleepTrackerProvider.getTrackerSleep(),
        _recomendationProvider.getRecomendation()
      ]);
      isLoading.value = false;
      trackerResponse.value = response[0] as TrackerTypePhysicalModel;
      moodTrackerResponse.value = response[1] as mood.TrackerTypeMoodModel;
      sleepTrackerResponse.value = response[2] as sleep.TrackerTypeSleepModel;
      recomendationResponse.value = response[3] as recom.RecomendationModel;
      getTracker();
      getMoodTracker();
      getSleepTracker();
      getRecomendation();
    } catch (e) {
      isLoading.value = false;
      debugPrint("error  $e");
    }
  }

  var trackerResponse =
      TrackerTypePhysicalModel(success: "", data: null, message: "", error: "")
          .obs;

  getTracker() async {
    try {
      if (trackerResponse.value.success == "Success") {
        Future.delayed(800.milliseconds);
        box.write(Keys.physicalCheckFrontBodyResponse,
            trackerResponse.value.data?[0].trackerDetail);
        box.write(Keys.physicalCheckBackBodyResponse,
            trackerResponse.value.data?[1].trackerDetail);
      } else {
        errorMessage.value = trackerResponse.value.message ?? "Error Message";
      }
    } catch (e) {
      isLoading.value = false;
      debugPrint("error  $e");
    }
  }

  var moodTrackerResponse =
      mood.TrackerTypeMoodModel(success: "", data: null, message: "", error: "")
          .obs;

  getMoodTracker() async {
    try {
      if (moodTrackerResponse.value.success == "Success") {
        Future.delayed(800.milliseconds);
        box.write(Keys.moodTrackerResponse,
            moodTrackerResponse.value.data?[0].trackerDetail);
      } else {
        errorMessage.value =
            moodTrackerResponse.value.message ?? "Error Message";
      }
    } catch (e) {
      isLoading.value = false;
      debugPrint("error  $e");
    }
  }

  var sleepTrackerResponse = sleep.TrackerTypeSleepModel(
          success: "", data: null, message: "", error: "")
      .obs;

  getSleepTracker() async {
    try {
      if (sleepTrackerResponse.value.success == "Success") {
        Future.delayed(800.milliseconds);
        box.write(Keys.sleepTrackerResponse,
            sleepTrackerResponse.value.data?[0].trackerDetail);
      } else {
        errorMessage.value =
            sleepTrackerResponse.value.message ?? "Error Message";
      }
    } catch (e) {
      isLoading.value = false;
      debugPrint("error  $e");
    }
  }

  var recomendationResponse =
      recom.RecomendationModel(success: "", data: null, message: "", error: "")
          .obs;

  getRecomendation() async {
    try {
      if (recomendationResponse.value.success == "Success") {
        Future.delayed(800.milliseconds);
        box.write(Keys.recomendationTrackerResponse,
            recomendationResponse.value.data?[0].trackerDetail);
      } else {
        errorMessage.value =
            recomendationResponse.value.message ?? "Error Message";
      }
    } catch (e) {
      isLoading.value = false;
      debugPrint("error  $e");
    }
  }

  ontapPhysical(index) async {
    if (index == 0) {
      await Get.toNamed(Routes.FRONT_BODY_CHECK);
      var box = GetStorage();
      var checkFront =
          box.read(Keys.physicalCheckFrontBodyResponse) as List<TrackerDetail>;
      var loop = 0;
      checkFront.forEach((e) {
        var isselected =
            e.jsonContent?.firstWhereOrNull((e) => e.isSelected == true)?.name;
        if (isselected.toString() != "null") {
          debugPrint("isselected $isselected");
          loop++;
        }
      });

      debugPrint("last notes ${checkFront[checkFront.length - 1].notes}");
      debugPrint("last notes ${checkFront[checkFront.length - 1].id}");

      if (loop == checkFront.length - 1) {
        trackerResponse.value.data?[index].isDone = true;
        trackerResponse.refresh();
        debugPrint("done ${trackerResponse.value.data?[index].isDone}");
        refresh();
      }
      carouselC.animateToPage(1, duration: 800.milliseconds);
    } else {
      await Get.toNamed(Routes.BACK_BODY_CHECK);
      var box = GetStorage();
      var cekBack =
          box.read(Keys.physicalCheckBackBodyResponse) as List<TrackerDetail>;
      var loop = 0;
      cekBack.forEach((e) {
        var isselected =
            e.jsonContent?.firstWhereOrNull((e) => e.isSelected == true)?.name;
        if (isselected != "" && isselected.toString() != "null") {
          debugPrint("isselected $isselected");
          loop++;
        }
      });

      if (loop == cekBack.length - 1) {
        trackerResponse.value.data?[index].isDone = true;
        trackerResponse.refresh();
        debugPrint("done ${trackerResponse.value.data?[index].isDone}");
        refresh();
      }
    }
  }

  bool get showButton {
    var data = trackerResponse.value.data;
    var loop = 0;
    data?.forEach((e) {
      debugPrint("isDone ${e.isDone}");
      debugPrint("title ${e.title}");

      if (e.isDone == true) {
        loop = loop + 1;
      }
    });
    debugPrint("loop $loop");
    debugPrint("data length ${data?.length}");

    if (loop == data?.length) {
      return true;
    }
    return false;
  }

  @override
  void onClose() {
    dispose();
    super.onClose();
  }
}

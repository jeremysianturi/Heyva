import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heyva/app/modules/mood_tracker/model/tracker_create_model.dart';
import 'package:heyva/app/modules/mood_tracker/model/tracker_post_model.dart'
    as post;
import 'package:heyva/app/modules/mood_tracker/mood_tracker_form/model/tracker_type_mood_model.dart'
    as mood;
import 'package:heyva/app/modules/mood_tracker/physical_check/model/tracker_type_physical_model.dart'
    as front;
import 'package:heyva/app/modules/mood_tracker/provider/tracker_provider.dart';
import 'package:heyva/app/modules/mood_tracker/sleep_check-in/model/tracker_type_sleep_model.dart'
    as sleep;
import 'package:heyva/constant/keys.dart';
import 'package:heyva/services/dio_services.dart';

import '../../../../routes/app_pages.dart';
import '../model/recomendation_model.dart';

class RecomendationController extends GetxController {
  var pagePosition = 0.obs;
  var box = GetStorage();

  var recomendationList = <TrackerDetail>[].obs;

  @override
  void onInit() {
    _client = DioClient();
    _trackerProvider = TrackerProvider(_client.init());

    recomendationList.assignAll(
        box.read(Keys.recomendationTrackerResponse) as List<TrackerDetail>);

    super.onInit();
  }

  bool get isShowButton {
    var findSelected = recomendationList[0]
        .jsonContent
        ?.firstWhereOrNull((e) => e.isSelected == true);

    if (findSelected.toString() != "null") {
      return true;
    }

    debugPrint("findSelect $findSelected");
    return false;
  }

  var isLoading = false.obs;
  late DioClient _client;
  late TrackerProvider _trackerProvider;
  var errorMessage = ''.obs;

  var trackerCreateModel =
      TrackerCreateModel(success: "", data: null, message: "", error: "").obs;

  var sleepList = <sleep.TrackerDetail>[].obs;
  var frontList = <front.TrackerDetail>[].obs;
  var backlist = <front.TrackerDetail>[].obs;
  var moodList = <mood.TrackerDetail>[].obs;

  generateRawJson() {
    sleepList.assignAll(
        box.read(Keys.sleepTrackerResponse) as List<sleep.TrackerDetail>);

    frontList.assignAll(box.read(Keys.physicalCheckFrontBodyResponse)
        as List<front.TrackerDetail>);

    backlist.assignAll(box.read(Keys.physicalCheckBackBodyResponse)
        as List<front.TrackerDetail>);

    moodList.assignAll(
        box.read(Keys.moodTrackerResponse) as List<mood.TrackerDetail>);

    var listdata = <post.Data>[];
    var postData = post.TrackerPostModel(data: listdata);

    listdata.clear();

    /// front

    var frontQuestion = <post.Response>[];
    for (var e in frontList) {
      var list = <String>[];
      e.jsonContent?.forEach((el) {
        if (el.isSelected == true) {
          list.add(el.id ?? "");
        }
      });
      frontQuestion.add(post.Response(
          answer: list, note: e.notes ?? "", trackerDetailId: e.id));
    }
    listdata.add(post.Data(
        type:box.read(Keys.phycicalCheckFrontBodyId), response: frontQuestion));

    /// back
    var backQuestion = <post.Response>[];
    for (var e in backlist) {
      var list = <String>[];
      e.jsonContent?.forEach((el) {
        if (el.isSelected == true) {
          list.add(el.id ?? "");
        }
      });
      backQuestion.add(post.Response(
          answer: list, note: e.notes ?? "", trackerDetailId: e.id));
    }
    listdata.add(post.Data(
        type: box.read(Keys.phycicalCheckBackBodyId), response: backQuestion));

    /// mood
    var moodQuestion = <post.Response>[];
    for (var e in moodList) {
      var list = <String>[];
      var notes = "";
      e.jsonContent?.forEach((el) {
        if (el.isSelected == true) {
          list.add(el.id ?? "");
        }
        if (el.notes != "") {
          notes = el.notes;
        }
      });
      if (e.notes != "") {
        notes = e.notes;
      }
      moodQuestion
          .add(post.Response(answer: list, note: notes, trackerDetailId: e.id));
    }
    listdata.add(post.Data(
        type: box.read(Keys.moodTrackerId), response: moodQuestion));

    ///sleep

    var sleepQuestion = <post.Response>[];
    for (var e in sleepList) {
      var list = <String>[];
      var notes = "";
      e.jsonContent?.forEach((el) {
        if (el.isSelected == true) {
          list.add(el.id ?? "");
        }
        if (el.notes != "") {
          notes = el.notes;
        }
      });
      if (e.notes != "") {
        notes = e.notes;
      }
      sleepQuestion
          .add(post.Response(answer: list, note: notes, trackerDetailId: e.id));
    }
    listdata.add(post.Data(
        type: box.read(Keys.sleepTrackerId), response: sleepQuestion));

    ///recomendation

    var recomQuestion = <post.Response>[];
    for (var e in recomendationList) {
      var list = <String>[];
      var notes = "";
      e.jsonContent?.forEach((el) {
        if (el.isSelected == true) {
          list.add(el.id ?? "");
        }
      });
      recomQuestion
          .add(post.Response(answer: list, note: notes, trackerDetailId: e.id));
    }
    listdata.add(post.Data(
        type: box.read(Keys.recomendationID), response: recomQuestion));

    debugPrint("----------------");
    log("post data ${postData.toJson()}");

    sendData(json: postData.toJson());
  }

  sendData({required json}) async {
    errorMessage.value = "";
    isLoading.value = true;
    try {
      trackerCreateModel.value =
          (await _trackerProvider.createTracker(json: json))!;
      isLoading.value = false;

      if (trackerCreateModel.value.success == "Success") {
        Get.toNamed(Routes.RECOMENDATION2);
      } else {
        errorMessage.value =
            trackerCreateModel.value.message ?? "Error Message";
      }
    } catch (e) {
      isLoading.value = false;
      debugPrint("error  $e");
    }
  }
}

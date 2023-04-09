import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heyva/constant/keys.dart';

import '../model/tracker_type_sleep_model.dart';

class SleepCheckInController extends GetxController {
  var pagePosition = 0.obs;
  var box = GetStorage();

  var sleepList = <TrackerDetail>[].obs;

  @override
  void onInit() {
    sleepList
        .assignAll(box.read(Keys.sleepTrackerResponse) as List<TrackerDetail>);

    var read = box.read(Keys.sleepTrackerResponse) as List<TrackerDetail>;
    debugPrint("data ${read.length}");

    super.onInit();
  }

  TextEditingController otherC = TextEditingController();

  onSelectFeeling(int index) {
    sleepList[pagePosition.value].jsonContent?[index].isSelected =
        !sleepList[pagePosition.value].jsonContent![index].isSelected;
    sleepList.refresh();
  }

  bool get isShowButton {
    if (sleepList[pagePosition.value].jsonContent.toString() == "null") {
      return true;
    }
    var loop = 0;
    sleepList[pagePosition.value].jsonContent?.forEach((e) {
      if (e.isSelected == true) {
        loop = loop + 1;
      }
    });

    return loop <= 3 && loop > 0 ? true : false;
  }

  onOther(val) {
    var jsonContentLength =
        sleepList[pagePosition.value].jsonContent?.length ?? 0;
    if (val.toString().length > 1) {
      sleepList[pagePosition.value]
          .jsonContent?[jsonContentLength - 1]
          .isSelected = true;

      sleepList[pagePosition.value].jsonContent?[jsonContentLength - 1].notes =
          val;
      debugPrint(
          "notes ${sleepList[pagePosition.value].jsonContent?[jsonContentLength - 1].notes}");

      sleepList.refresh();
    } else {
      sleepList[pagePosition.value]
          .jsonContent?[jsonContentLength - 1]
          .isSelected = false;
      sleepList[pagePosition.value].jsonContent?[jsonContentLength - 1].notes =
          "";
    }
  }
}

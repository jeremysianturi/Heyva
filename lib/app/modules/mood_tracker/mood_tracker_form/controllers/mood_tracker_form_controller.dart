import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heyva/app/modules/mood_tracker/mood_tracker_form/model/tracker_type_mood_model.dart';
import 'package:heyva/constant/keys.dart';

class MoodTrackerFormController extends GetxController {
  var pagePosition = 0.obs;
  var box = GetStorage();

  var moodList = <TrackerDetail>[].obs;

  @override
  void onInit() {
    moodList
        .assignAll(box.read(Keys.moodTrackerResponse) as List<TrackerDetail>);

    var read = box.read(Keys.moodTrackerResponse) as List<TrackerDetail>;
    debugPrint("data ${read.length}");

    super.onInit();
  }

  TextEditingController otherC = TextEditingController();

  onSelectFeeling(int index) {
    FocusScope.of(Get.context!).unfocus();
    if (pagePosition.value != 0) {
      debugPrint("page position ${pagePosition.value}");
      moodList[pagePosition.value]
          .jsonContent
          ?.firstWhereOrNull((e) => e.isSelected == true)
          ?.isSelected = false;
    }
    moodList[pagePosition.value].jsonContent?[index].isSelected =
        !moodList[pagePosition.value].jsonContent![index].isSelected;
    moodList.refresh();
  }

  bool get isShowButton {
    if (moodList[pagePosition.value].jsonContent.toString() == "null") {
      return true;
    }
    var loop = 0;
    moodList[pagePosition.value].jsonContent?.forEach((e) {
      if (e.isSelected == true) {
        loop = loop + 1;
      }
    });

    return loop <= 3 && loop > 0 ? true : false;
  }

  onOther(val) {
    var jsonContentLength =
        moodList[pagePosition.value].jsonContent?.length ?? 0;
    if (val.toString().length > 0) {
      moodList[pagePosition.value]
          .jsonContent?[jsonContentLength - 1]
          .isSelected = true;

      moodList[pagePosition.value].jsonContent?[jsonContentLength - 1].notes =
          val;
      debugPrint(
          "notes ${moodList[pagePosition.value].jsonContent?[jsonContentLength - 1].notes}");

      moodList.refresh();
    } else {
      moodList[pagePosition.value]
          .jsonContent?[jsonContentLength - 1]
          .isSelected = false;
      moodList[pagePosition.value].jsonContent?[jsonContentLength - 1].notes =
          "";
    }
  }
}

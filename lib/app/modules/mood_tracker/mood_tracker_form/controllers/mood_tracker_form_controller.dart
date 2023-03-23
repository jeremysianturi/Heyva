import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heyva/app/modules/mood_tracker/model/mood_list_model.dart';

class MoodTrackerFormController extends GetxController {
  var list = <MoodListModel>[].obs;
  var pagePosition = 0.obs;

  @override
  void onInit() {
    initDummyData();
    super.onInit();
  }

  initDummyData() {
    list.addAll([
      MoodListModel(
        name: 'Happy',
        isSelected: false.obs,
      ),
      MoodListModel(
        name: 'Sad',
        isSelected: false.obs,
      ),
      MoodListModel(
        name: 'Joy',
        isSelected: false.obs,
      ),
      MoodListModel(
        name: 'Afraid',
        isSelected: false.obs,
      ),
      MoodListModel(
        name: 'Gratefull',
        isSelected: false.obs,
      ),
      MoodListModel(
        name: 'Doublt',
        isSelected: false.obs,
      ),
      MoodListModel(
        name: 'Relaxed',
        isSelected: false.obs,
      ),
      MoodListModel(
        name: 'Angry',
        isSelected: false.obs,
      ),
    ]);
  }

  // List<MoodListModel> list2 = [
  //   MoodListModel(
  //     name: 'Happy',
  //     isSelected: false.obs,
  //   ),
  //   MoodListModel(
  //     name: 'Sad',
  //     isSelected: false.obs,
  //   ),
  //   MoodListModel(
  //     name: 'Joy',
  //     isSelected: false.obs,
  //   ),
  //   MoodListModel(
  //     name: 'Afraid',
  //     isSelected: false.obs,
  //   ),
  //   MoodListModel(
  //     name: 'Gratefull',
  //     isSelected: false.obs,
  //   ),
  //   MoodListModel(
  //     name: 'Doublt',
  //     isSelected: false.obs,
  //   ),
  //   MoodListModel(
  //     name: 'Relaxed',
  //     isSelected: false.obs,
  //   ),
  //   MoodListModel(
  //     name: 'Angry',
  //     isSelected: false.obs,
  //   ),
  // ].obs;
  TextEditingController otherC = TextEditingController();

  onSelectFeeling(int index) {
    //force false all
    list.firstWhereOrNull((e) => e.isSelected.isTrue)?.isSelected.value = false;

    //change to true salected indes
    list[index].isSelected.value = true;
    debugPrint("list is selected ${list[index].isSelected.value}");
    list.refresh();
  }
}

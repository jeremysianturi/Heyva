import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heyva/app/modules/mood_tracker/physical_check/model/tracker_type_physical_model.dart';
import 'package:heyva/constant/keys.dart';

class BackBodyCheckController extends GetxController {
  var pagePosition = 0.obs;
  var box = GetStorage();

  var frontList = <TrackerDetail>[].obs;

  @override
  void onInit() {
    frontList.assignAll(
        box.read(Keys.physicalCheckBackBodyResponse) as List<TrackerDetail>);

    var read =
        box.read(Keys.physicalCheckBackBodyResponse) as List<TrackerDetail>;
    debugPrint("data ${read.length}");

    super.onInit();
  }
}

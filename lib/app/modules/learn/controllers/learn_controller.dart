import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heyva/app/modules/learn/model/program_list_model.dart';
import 'package:heyva/app/modules/learn/provider/learn_provider.dart';
import 'package:heyva/services/dio_services.dart';

class FolderModel {
  FolderModel({required this.name, required this.iconPath});

  final String name;
  final String iconPath;
}

class LearnController extends GetxController {
  var folderList = <FolderModel>[
    FolderModel(
        name: "Postpartum", iconPath: "assets/icons/ic_postpartum1.svg"),
    FolderModel(
        name: "Postpartum", iconPath: "assets/icons/ic_postpartum2.svg"),
    FolderModel(name: "Feeding", iconPath: "assets/icons/ic_feeding.svg"),
    FolderModel(name: "Pelvic Health", iconPath: "assets/icons/ic_bones.svg"),
    FolderModel(
        name: "Mental Health", iconPath: "assets/icons/ic_mental_health.svg"),
    FolderModel(
        name: "Body Recovery", iconPath: "assets/icons/ic_body_recover.svg"),
  ];

  var isLoading = false.obs;
  late DioClient _dioClient;
  late LearnProvider _learnProvider;
  var box = GetStorage();

  var errorMessage = ''.obs;
  var isEmailError = false.obs;
  var isPasserror = false.obs;

  @override
  void onInit() {
    _dioClient = DioClient();
    _learnProvider = LearnProvider(_dioClient.init());
    getProgram();
    super.onInit();
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

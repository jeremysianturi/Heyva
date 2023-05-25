import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heyva/app/modules/learn/model/program_list_model.dart';
import 'package:heyva/app/modules/learn/provider/learn_provider.dart';
import 'package:heyva/services/dio_services.dart';

class FolderModel {
  FolderModel(
      {required this.tagId, required this.name, required this.iconPath});

  final String name;
  final String iconPath;
  final String tagId;
}

class LearnController extends GetxController {
  var folderList = <FolderModel>[
    FolderModel(
        name: "Newborn",
        iconPath: "assets/icons/ic_postpartum1.svg",
        tagId: '33914c3e-0c63-4d78-96d5-cccf4cef0a0f'),
    FolderModel(
        name: "Postpartum",
        iconPath: "assets/icons/ic_postpartum2.svg",
        tagId: '89b2aae1-7981-48da-ae9f-7116f1b5e007'),
    FolderModel(
        name: "Bottle feeding",
        iconPath: "assets/icons/ic_feeding.svg",
        tagId: "deba8feb-5352-4f01-b85b-bd8c25ec55ea"),
    FolderModel(
        name: "Pelvic Health",
        iconPath: "assets/icons/ic_bones.svg",
        tagId: "9c47708c-2fc4-43e7-b516-a1a2c5eb9dc6"),
    FolderModel(
        name: "Mental Health",
        iconPath: "assets/icons/ic_mental_health.svg",
        tagId: "f9e70a98-8fd7-46c3-ab41-4bdce9ad3fda"),
    FolderModel(
        name: "Body Recovery",
        iconPath: "assets/icons/ic_body_recover.svg",
        tagId: "b921ef45-0c23-4227-8b84-1a658d396563"),
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

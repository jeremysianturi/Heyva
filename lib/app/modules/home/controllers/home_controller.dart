import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heyva/app/modules/detaildoctor/model/doctor_list_model.dart';
import 'package:heyva/app/modules/detaildoctor/provider/doctor_provider.dart';
import 'package:heyva/app/modules/related_program/model/content_list_model.dart';
import 'package:heyva/app/modules/related_program/provider/related_program_provider.dart';
import 'package:heyva/services/dio_services.dart';

class HomeController extends GetxController {
  var currentSteps = 0.obs;

  var isLoading = false.obs;
  late DioClient _client;
  late DoctorProvider _doctorProvider;
  late RelatedProgramProvider _programProvider;
  var errorMessage = ''.obs;
  var isEmailError = false.obs;
  var isPasserror = false.obs;

  int get doctorLength {
    var data = doctorListResponse.value.data?.length ?? 0;
    return data > 2 ? 2 : data;
  }

  int get programLength {
    var data = contentListResponse.value.data?.length ?? 0;
    return data > 2 ? 2 : data;
  }

  @override
  void onInit() {
    _client = DioClient();
    _doctorProvider = DoctorProvider(_client.init());
    _programProvider = RelatedProgramProvider(_client.init());
    getListDoctor();
    getListContent();
    super.onInit();
  }

  var doctorListResponse =
      DoctorListModel(success: "", data: null, message: "", error: "").obs;

  getListDoctor() async {
    errorMessage.value = "";
    isLoading.value = true;
    try {
      doctorListResponse.value = (await _doctorProvider.getListDoctor())!;
      isLoading.value = false;

      if (doctorListResponse.value.success == "Success") {
      } else {
        errorMessage.value =
            doctorListResponse.value.message ?? "Error Message";
      }
    } catch (e) {
      isLoading.value = false;

      debugPrint("error  $e");
    }
  }

  var contentListResponse =
      ContentListModel(success: "", data: null, message: "", error: "").obs;

  getListContent() async {
    errorMessage.value = "";
    isLoading.value = true;
    try {
      contentListResponse.value =
          (await _programProvider.getContentList(tagId: ""))!;
      isLoading.value = false;

      if (contentListResponse.value.success == "Success") {
      } else {
        errorMessage.value =
            contentListResponse.value.message ?? "Error Message";
      }
    } catch (e) {
      isLoading.value = false;

      debugPrint("error  $e");
    }
  }
}

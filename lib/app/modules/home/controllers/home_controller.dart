import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heyva/app/modules/detaildoctor/model/doctor_list_model.dart';
import 'package:heyva/app/modules/detaildoctor/provider/doctor_provider.dart';
import 'package:heyva/app/modules/profile/model/profile_model.dart';
import 'package:heyva/app/modules/profile/provider/profile_provider.dart';
import 'package:heyva/app/modules/related_program/model/content_list_model.dart';
import 'package:heyva/app/modules/related_program/provider/related_program_provider.dart';
import 'package:heyva/constant/keys.dart';
import 'package:heyva/services/dio_services.dart';

class HomeController extends GetxController {
  var currentSteps = 0.obs;

  var isLoading = false.obs;
  late DioClient _client;
  late DoctorProvider _doctorProvider;
  late RelatedProgramProvider _programProvider;
  late ProfileProvider _profileProvider;
  var errorMessage = ''.obs;
  var isEmailError = false.obs;
  var isPasserror = false.obs;
  var box = GetStorage();

  String get profileName {
    var read = box.read(Keys.profileName) ?? "";
    if (read.toString().isNotEmpty) {
      return box.read(Keys.profileName) ?? "";
    } else {
      return profileResponse.value.data?.fullName ?? "";
    }
  }

  String get profileAvatar {
    var read = box.read(Keys.profileImgUrl) ?? "";
    if (read.toString().isNotEmpty) {
      return box.read(Keys.profileImgUrl) ?? "";
    } else {
      return profileResponse.value.data?.avatar ?? "";
    }
  }

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
    _profileProvider = ProfileProvider(_client.init());
    getListDoctor();
    getListContent();
    getProfile();
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

  var profileResponse =
      ProfileModel(success: "", data: null, message: "", error: "").obs;

  getProfile() async {
    debugPrint("read profile name ${box.read(Keys.profileName)}");
    debugPrint(
        "read profile name ${(box.read(Keys.profileName).toString() != "null")}");
    if (box.read(Keys.profileName).toString() != "null") {
      return null;
    }
    errorMessage.value = "";
    isLoading.value = true;
    try {
      profileResponse.value = (await _profileProvider.getProfile())!;
      isLoading.value = false;

      if (profileResponse.value.success == "Success") {
        var data = profileResponse.value.data;
        box.write(Keys.profileName, data?.fullName);
        // box.write(Keys.profileEmail, data?.e);
        box.write(Keys.profileImgUrl, data?.avatar);
        // box.write(Keys.profilePhone, data?.fullName);
      } else {
        errorMessage.value = profileResponse.value.message ?? "Error Message";
      }
    } catch (e) {
      isLoading.value = false;
      debugPrint("error  $e");
    }
  }

  String get greeting {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    }
    if (hour < 17) {
      return 'Good Afternoon';
    }
    return 'Good Evening';
  }
}

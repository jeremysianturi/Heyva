import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heyva/app/modules/profile/model/profile_model.dart';
import 'package:heyva/app/modules/profile/provider/profile_provider.dart';
import 'package:heyva/constant/keys.dart';
import 'package:heyva/services/dio_services.dart';

class InsightsController extends GetxController {
  var currentIndex = 1.obs;

  var isLoading = false.obs;
  late DioClient _client;
  late ProfileProvider _profileProvider;
  var errorMessage = ''.obs;
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

  @override
  void onInit() {
    _client = DioClient();
    _profileProvider = ProfileProvider(_client.init());
    getProfile();
    super.onInit();
  }

  var profileResponse =
      ProfileModel(success: "", data: null, message: "", error: "").obs;

  getProfile() async {
    if (box.read(Keys.profileName) != "") {
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

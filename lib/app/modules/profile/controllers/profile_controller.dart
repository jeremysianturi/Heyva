import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heyva/app/modules/profile/model/profile_model.dart';
import 'package:heyva/app/modules/profile/provider/profile_provider.dart';
import 'package:heyva/app/routes/app_pages.dart';
import 'package:heyva/app/widgets/bottom_sheet_invite.dart';
import 'package:heyva/constant/keys.dart';
import 'package:heyva/services/dio_services.dart';

class ProfileController extends GetxController {
  var isLoading = false.obs;
  late DioClient _client;
  late ProfileProvider _profileProvider;
  var errorMessage = ''.obs;
  var box = GetStorage();

  String get profileName {
    return profileResponse.value.data?.fullName ?? "";
  }

  String get email {
    return profileResponse.value.data?.user?.email ?? "";
  }

  String get phone {
    return profileResponse.value.data?.user?.phoneNumber ?? "";
  }

  String get profileAvatar {
    return profileResponse.value.data?.avatar ?? "";
  }

  var profileSettings = [
    "Change Password",
    "Invite Friends",
    "Privacy Policy",
    "Terms of Service",
    "Rate our App",
    "Notification Settings",
  ];

  onTapSettings(int index) {
    if (index == 0) {
      Get.toNamed(Routes.CHANGE_PASSWORD);
    }
    if (index == 1) {
      inviteFriends();
    }
    if (index == 2) {
      Get.toNamed(Routes.IN_APP_WEB_VIEW,
          arguments: {Keys.arUrl: "http://54.169.131.201/#/privacypolicy"});
    }
    if (index == 3) {
      Get.toNamed(Routes.IN_APP_WEB_VIEW,
          arguments: {Keys.arUrl: "http://54.169.131.201/#/termsofservice"});
    }
    if (index == 4) {}
    if (index == 5) {
      Get.toNamed(Routes.NOTIFICATION_SETTINGS);
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
    errorMessage.value = "";
    isLoading.value = true;
    try {
      profileResponse.value = (await _profileProvider.getProfile())!;
      isLoading.value = false;
      if (profileResponse.value.success == "Success") {
        var data = profileResponse.value.data;
        box.write(Keys.profileName, data?.fullName);
        box.write(Keys.profileEmail, data?.user?.email);
        box.write(Keys.profileImgUrl, data?.avatar);
        box.write(Keys.profilePhone, data?.user?.phoneNumber);
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

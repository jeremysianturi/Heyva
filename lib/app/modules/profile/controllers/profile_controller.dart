import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heyva/app/modules/profile/model/profile_model.dart';
import 'package:heyva/app/modules/profile/provider/profile_provider.dart';
import 'package:heyva/app/routes/app_pages.dart';
import 'package:heyva/constant/colors.dart';
import 'package:heyva/constant/keys.dart';
import 'package:heyva/constant/strings.dart';
import 'package:heyva/constant/variabels.dart';
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
    "FAQ",
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
      Get.toNamed(Routes.PRIVACY_POLICY);
    }
    if (index == 3) {
      Get.toNamed(Routes.FAQ);
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

  /// bottomsheet
  logout() {
    Get.bottomSheet(
      Container(
          padding: const EdgeInsets.all(20),
          height: 218,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    Strings.doYouWanttoLogout,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: ColorApp.blue_container),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: CircleAvatar(
                      backgroundColor: ColorApp.btn_orange,
                      child: Transform.rotate(
                        angle: 180 * math.pi / 100,
                        child: const Icon(
                          Icons.add,
                          color: ColorApp.white,
                          size: 28,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(18),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            backgroundColor: ColorApp.btn_orange),
                        child: const Text(
                          Strings.noTakeMeBack,
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: ColorApp.arrow_white),
                        ),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(18),
                            side: const BorderSide(
                                width: 2, color: ColorApp.btn_orange),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            backgroundColor: ColorApp.white),
                        child: const Text(
                          Strings.yeSure,
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: ColorApp.btn_orange),
                        ),
                        onPressed: () {
                          var box = GetStorage();
                          box.remove(Keys.loginAccessToken);
                          box.remove(Keys.loginRefreshToken);
                          box.remove(Keys.loginID);
                          box.remove(Keys.profileName);
                          box.remove(Keys.profileImgUrl);
                          authToken = "";
                          refreshToken = "";
                          Future.delayed(800.seconds);
                          Get.offNamed(Routes.SIGNUP);
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
      isDismissible: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(15), topLeft: Radius.circular(15)),
      ),
      backgroundColor: ColorApp.white,
      enableDrag: false,
    );
  }

  inviteFriends() {
    Get.bottomSheet(
      Container(
          padding: const EdgeInsets.all(20),
          height: 218,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    Strings.inviteYourFriends,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: ColorApp.blue_container),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: CircleAvatar(
                      backgroundColor: ColorApp.btn_orange,
                      child: Transform.rotate(
                        angle: 180 * math.pi / 100,
                        child: const Icon(
                          Icons.add,
                          color: ColorApp.white,
                          size: 28,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        backgroundColor: ColorApp.btn_orange),
                    child: Row(
                      children: [
                        SvgPicture.asset("assets/icons/ic_whatsapp.svg"),
                        const SizedBox(
                          width: 32,
                        ),
                        const Expanded(
                          child: Text(
                            Strings.whatsapp,
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                color: ColorApp.arrow_white),
                          ),
                        ),
                        Image.asset("assets/icons/ic_arrow_right.png"),
                      ],
                    ),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ),
              )
            ],
          )),
      isDismissible: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(15), topLeft: Radius.circular(15)),
      ),
      backgroundColor: ColorApp.white,
      enableDrag: false,
    );
  }
}

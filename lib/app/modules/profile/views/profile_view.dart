import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heyva/app/modules/profile/widget/profile_detail.dart';
import 'package:heyva/app/modules/profile/widget/profile_header.dart';
import 'package:heyva/app/modules/profile/widget/profile_settings_item.dart';
import 'package:heyva/app/routes/app_pages.dart';
import 'package:heyva/constant/colors.dart';
import 'package:heyva/constant/strings.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => LoadingOverlay(
        isLoading: controller.isLoading.value,
        color: Colors.grey,
        progressIndicator: const CircularProgressIndicator(
          color: ColorApp.btn_orange,
        ),
        opacity: 0.3,
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
              height: Get.height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/bg_heyva2.png"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 14),
                      child: ProfileHeader(
                        centerTitle: Strings.detailProfile,
                        showIcon: true,
                        titleColor: ColorApp.blue_container,
                        showCenterTitle: true,
                        ontapIcon: () async {
                          controller.logout();
                        },
                        onBack: () {
                          Get.back(result: "reload");
                        },
                        isCostomBackFucntion: true,
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  ProfileDetail(
                    controller: controller,
                    ontap: () async {
                      var data = await Get.toNamed(Routes.EDIT_PROFILE);
                      debugPrint("alsdjkalksd data $data");
                      controller.onInit();
                    },
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: controller.profileSettings.length,
                    itemBuilder: (BuildContext context, int index) =>
                        ProfileSettingsItem(
                      title: controller.profileSettings[index],
                      ontap: () {
                        controller.onTapSettings(index);
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 53,
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      width: Get.width,
                      padding: EdgeInsets.symmetric(horizontal: 14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14.0),
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                              "assets/images/bg_blue_container_medal.png"),
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Dui massa malesuada",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: ColorApp.white_font),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "Ut ultricies augue quam eu eu eros quis justo. Sed ut scelerisque.",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: ColorApp.grey_card_font),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: const Icon(
                              Icons.arrow_forward_ios,
                              color: ColorApp.white_font,
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ))));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:heyva/app/modules/learn/Widget/upcoming_wdget.dart';
import 'package:heyva/app/modules/profile/widget/profile_detail.dart';
import 'package:heyva/app/modules/profile/widget/profile_header.dart';
import 'package:heyva/app/modules/profile/widget/profile_settings_item.dart';
import 'package:heyva/app/widgets/reusable_orange_button_with_trailing_icon.dart';
import 'package:heyva/constant/colors.dart';
import 'package:heyva/constant/strings.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Container(
            height: Get.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bg_heyva2.png"),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              children: [
                Container(
                    margin: const EdgeInsets.only(top: 14),
                    child: const ProfileHeader(
                      centerTitle: Strings.detailProfile,
                      showIcon: true,
                      showCenterTitle: true,
                    )),
                const SizedBox(
                  height: 30,
                ),
                const ProfileDetail(),
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
          ),
        ));
  }
}

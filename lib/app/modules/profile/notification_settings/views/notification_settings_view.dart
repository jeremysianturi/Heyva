import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heyva/app/modules/profile/notification_settings/widget/notif_setting_item.dart';
import 'package:heyva/app/modules/profile/widget/profile_header.dart';
import 'package:heyva/constant/colors.dart';
import 'package:heyva/constant/strings.dart';

import '../controllers/notification_settings_controller.dart';

class NotificationSettingsView extends GetView<NotificationSettingsController> {
  const NotificationSettingsView({Key? key}) : super(key: key);

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
                      centerTitle: Strings.profile,
                      showIcon: false,
                      showCenterTitle: false,
                    )),
                const SizedBox(
                  height: 22,
                ),
                const Text(
                  Strings.notifSetting,
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 28,
                      color: ColorApp.black_font_underline),
                ),
                const SizedBox(
                  height: 65,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Obx(() => NotifSettingItem(
                            status: controller.pushNotifStatus.value,
                            ontap: () {
                              controller.pushNotifStatus.value =
                                  !controller.programNotifStatus.value;
                            },
                            title: Strings.pushNotif,
                          )),
                      const SizedBox(
                        height: 19,
                      ),
                      Obx(() => NotifSettingItem(
                            status: controller.programNotifStatus.value,
                            ontap: () {
                              controller.programNotifStatus.value =
                                  !controller.programNotifStatus.value;
                            },
                            title: Strings.programNotification,
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

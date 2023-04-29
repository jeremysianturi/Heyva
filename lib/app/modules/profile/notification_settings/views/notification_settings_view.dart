import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heyva/app/modules/profile/widget/profile_header.dart';
import 'package:heyva/app/widgets/reusable_switchbtn_group.dart';
import 'package:heyva/constant/colors.dart';
import 'package:heyva/constant/strings.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../controllers/notification_settings_controller.dart';

class NotificationSettingsView extends GetView<NotificationSettingsController> {
  const NotificationSettingsView({Key? key}) : super(key: key);

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
                  Container(
                      margin: const EdgeInsets.only(top: 40),
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
                        color: ColorApp.blue_container),
                  ),
                  const SizedBox(
                    height: 65,
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (c, i) {
                        var data = controller.response.value.data?[i];
                        return ReusableSwitchButton(
                          title: data?.jsonContent?.title ?? "",
                          desc: data?.jsonContent?.body ?? "",
                          index: i,
                          isActive: data?.isAgree ?? false,
                          onChange: (value) {
                            controller.response.value.data?[i].isAgree = value;
                            controller.response.refresh();
                            debugPrint("index $i value $value");
                            controller.generateRawJson();
                          },
                        );
                      }),
                ],
              ),
            ))));
  }
}

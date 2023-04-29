import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:heyva/app/modules/profile/widget/profile_header.dart';
import 'package:heyva/constant/colors.dart';
import 'package:heyva/constant/strings.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../controllers/notification_center_controller.dart';

class NotificationCenterView extends GetView<NotificationCenterController> {
  const NotificationCenterView({Key? key}) : super(key: key);

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
                  image: AssetImage("assets/images/bg_heyva.png"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(children: [
                const SizedBox(
                  height: 40,
                ),
                Container(
                    margin: const EdgeInsets.only(top: 14),
                    child: ProfileHeader(
                      centerTitle: Strings.notificationCenter,
                      showIcon: false,
                      titleColor: ColorApp.blue_container,
                      showCenterTitle: true,
                      ontapIcon: () async {},
                      onBack: () {
                        Get.back(result: "reload");
                      },
                      isCostomBackFucntion: true,
                    )),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: List.generate(
                        5,
                        (index) => NotificationItem(
                              index: index,
                            )),
                  ),
                ),
              ]),
            ))));
  }
}

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: index != 0 ? 18 : 0),
      decoration: BoxDecoration(
          color: index == 0 ? ColorApp.text_input_bg : Colors.transparent,
          borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset(
            "assets/icons/ic_yoga.svg",
            width: 24,
            height: 24,
            fit: BoxFit.contain,
          ),
          const SizedBox(
            width: 17,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Let’s exercise!",
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 16,
                    color: ColorApp.blue_container),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                "You haven’t take any exercise today. Let’s go!",
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 16,
                    color: ColorApp.blue_container.withOpacity(0.6)),
              )
            ],
          )),
          Container(
            child: const Icon(
              Icons.arrow_forward_ios,
              color: ColorApp.black,
            ),
          ),
        ],
      ),
    );
  }
}

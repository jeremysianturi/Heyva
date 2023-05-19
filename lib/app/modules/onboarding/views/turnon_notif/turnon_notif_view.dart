import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heyva/app/routes/app_pages.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../../../../constant/colors.dart';
import '../../../../../constant/strings.dart';
import '../../../../widgets/reusable_header.dart';
import '../../../../widgets/reusable_orange_button_with_trailing_icon.dart';
import '../../../../widgets/reusable_switchbtn_group.dart';
import '../../controllers/turnon_notif/turnon_notif_controller.dart';

class TurnOnNotifView extends GetView<TurnOnNotifController> {
  TurnOnNotifView({Key? key}) : super(key: key);
  final turnOnController = Get.put(TurnOnNotifController());

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
          body: Container(
            height: double.maxFinite,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bg_heyva.png"),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Header(
                    rightText: Strings.skip,
                    ontapIcon: () {
                      Get.toNamed(Routes.ONBOARDING_FINISH);
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                    width: 141,
                    height: 151,
                    child: Image.asset(
                      "assets/images/img_flower.png",
                      fit: BoxFit.cover,
                    )),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  Strings.turn_on_notif_text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ColorApp.blue_container,
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 36,
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
                        },
                      );
                    }),
                const Expanded(child: SizedBox()),
                OrangeButtonWTrailingIcon(
                  determineAction: "ontap",
                  text: Strings.lets_go,
                  ontap: () {
                    controller.generateRawJson();
                  },
                ),
              ],
            ),
          ),
        )));
  }
}

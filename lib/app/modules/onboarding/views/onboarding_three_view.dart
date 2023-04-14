import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../../../constant/colors.dart';
import '../../../../constant/strings.dart';
import '../../../widgets/reusable_btn_wo_icon.dart';
import '../../../widgets/reusable_onboarding_header.dart';
import '../controllers/onboarding_three_controller.dart';

class OnBoardingThreeView extends GetView<OnBoardingThreeController> {
  const OnBoardingThreeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => LoadingOverlay(
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
                const SizedBox(
                  height: 40,
                ),
                OnBoardingHeader(
                  indicatorColor1: ColorApp.btn_orange,
                  indicatorColor2: ColorApp.btn_orange,
                  indicatorColor3: ColorApp.grey_divider,
                  title: Strings.pregnant_ques_text,
                  subtitle: Strings.curating_journey_text,
                ),
                const SizedBox(
                  height: 56,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                      children: List.generate(
                    controller.statusList.length,
                    (index) => Container(
                      margin: EdgeInsets.only(top: index == 0 ? 0 : 12),
                      child: reusable_btn_wo_icon(
                        text: controller.statusList[index].name ?? "",
                        color: index == 0
                            ? ColorApp.btn_orange
                            : index == 1
                                ? ColorApp.btn_pink
                                : ColorApp.btn_maroon,
                        ontap: () {
                          controller.onTap(
                              pregnancyStatusId:
                                  controller.statusList[index].id ?? "",
                              index: index);
                        },
                      ),
                    ),
                  )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

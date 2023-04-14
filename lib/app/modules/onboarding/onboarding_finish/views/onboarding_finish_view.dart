import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heyva/app/widgets/reusable_orange_button_with_trailing_icon.dart';
import 'package:heyva/constant/colors.dart';
import 'package:heyva/constant/strings.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../controllers/onboarding_finish_controller.dart';

class OnboardingFinishView extends GetView<OnboardingFinishController> {
  const OnboardingFinishView({Key? key}) : super(key: key);

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
                const SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  onTap: () {
                    controller.postLogin();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text(
                        Strings.skip,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: ColorApp.black),
                      ),
                      SizedBox(
                        width: 20,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                    width: 250,
                    height: 250,
                    child: Image.asset(
                      "assets/images/img_orange_woman.png",
                      fit: BoxFit.cover,
                    )),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    "Congratulation, ${controller.username}! You are now part of Heyva family",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: ColorApp.blue_container,
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    Strings.letsStart,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ColorApp.grey_font,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 36,
                ),
                const Expanded(child: SizedBox()),
                OrangeButtonWTrailingIcon(
                  determineAction: "ontap",
                  text: Strings.lets_go,
                  ontap: () {
                    controller.postLogin();
                  },
                ),
              ],
            ),
          ),
        )));
  }
}

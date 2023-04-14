import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heyva/app/modules/onboarding/controllers/onboarding_one_controller.dart';

import '../../../../constant/colors.dart';
import '../../../../constant/strings.dart';
import '../../../widgets/reusable_orange_button_with_trailing_icon.dart';

class OnBoardingOneView extends GetView<OnBoardingOneController> {
  const OnBoardingOneView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // String name = "Priscilla";
    return Scaffold(
      body: Container(
        height: Get.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg_heyva.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                child: Image.asset("assets/images/img_oboarding.png")),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: Get.width,
                      child: Text(
                        "${Strings.welcomeTo}\n${controller.fullName}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                            color: ColorApp.blue_container),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: Get.width,
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    Strings.haveUsAssist,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: ColorApp.grey_font),
                  ),
                ),
              ],
            ),
            Expanded(child: SizedBox()),
            OrangeButtonWTrailingIcon(
              determineAction: "from_onboarding_one",
              text: Strings.next,
            ),
          ],
        ),
      ),
    );
  }
}

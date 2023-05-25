import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:heyva/app/widgets/reusable_orange_button_with_trailing_icon.dart';
import 'package:heyva/constant/colors.dart';
import 'package:heyva/constant/keys.dart';
import 'package:heyva/constant/strings.dart';

import '../controllers/breathing_finish_controller.dart';

class BreathingFinishView extends GetView<BreathingFinishController> {
  const BreathingFinishView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg_breating_exercise.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Stack(
          children: [
            SizedBox(
              width: Get.width,
              height: Get.height,
              child: Stack(
                children: [
                  Positioned(
                    left: 20,
                    top: 200,
                    child:
                    SvgPicture.asset("assets/icons/ic_yellow_flower.svg"),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 140,
                    child: SvgPicture.asset("assets/icons/ic_red_flower.svg"),
                  )
                ],
              ),
            ),
            Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                Row(
                  children: [
                    const Expanded(child: SizedBox()),
                    const Text(
                      Strings.breathing_exercise,
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          color: ColorApp.black_article_title,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                    Expanded(
                      child: Text(
                        "",
                        // Strings.skip,
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            color: ColorApp.black.withOpacity(0.3),
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.end,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        Strings.completeExercise,
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                            color: ColorApp.blue_container),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "I hope you feel better. Make this exercise as a habit and you will see a long-term change.",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: ColorApp.grey_font),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                )),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: OrangeButtonWTrailingIcon(
                    determineAction: "from_onplanning_one",
                    text: Strings.lets_go,
                    ontap: () {
                      controller.programPersonalTrackerFinish(
                          programId:
                              controller.box.read(Keys.programIdChildStorage));
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

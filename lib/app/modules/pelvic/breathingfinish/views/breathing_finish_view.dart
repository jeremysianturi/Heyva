import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heyva/app/widgets/reusable_orange_button_with_trailing_icon.dart';
import 'package:heyva/constant/keys.dart';

import '../../../../../constant/colors.dart';
import '../../../../../constant/strings.dart';
import '../controllers/breathing_finish_controller.dart';

class BreathingFinishView extends GetView<BreathingFinishController> {
  const BreathingFinishView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(BreathingFinishController());
    return Scaffold(
      body: Container(
        height: Get.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg_breating_exercise.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(),
                    GestureDetector(
                      onTap: () {
                        controller.programPersonalTrackerFinish(
                            programId: controller.box
                                .read(Keys.programIdChildStorage));
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(top: 67),
                        child: Text(
                          Strings.done,
                          style: TextStyle(
                              color: ColorApp.blue_container,
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      width: Get.width,
                      decoration: const BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/pelvic_done_img.png"),
                              fit: BoxFit.cover)),
                    ),
                  ),
                ),
                OrangeButtonWTrailingIcon(
                  determineAction: "ontap",
                  text: Strings.goToHome,
                  ontap: () {
                    controller.programPersonalTrackerFinish(
                        programId:
                            controller.box.read(Keys.programIdChildStorage));
                  },
                )
              ]),
        ),
      ),
    );
  }
}

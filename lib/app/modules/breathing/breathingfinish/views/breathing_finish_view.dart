import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        height: double.maxFinite,
        color: ColorApp.btn_pink,
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
                            programId:
                                controller.box.read(Keys.programIdChildStorage));
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(top: 67),
                        child: Text(
                          Strings.done,
                          style: TextStyle(
                              color: ColorApp.txt_white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: Get.width,
                  child: Text(
                    controller.pelvic6,
                    style: const TextStyle(
                      color: ColorApp.txt_white,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(),
              ]),
        ),
      ),
    );
  }
}

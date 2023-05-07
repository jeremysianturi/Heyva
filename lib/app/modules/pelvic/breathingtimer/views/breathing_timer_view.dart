import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heyva/app/modules/pelvic/breathingfinish/views/breathing_finish_view.dart';
import 'package:lottie/lottie.dart';

import '../../../../../constant/colors.dart';
import '../../../../../constant/strings.dart';
import '../controllers/breathing_timer_controller.dart';

class BreathingTimerView extends GetView<BreathingTimerController> {
  const BreathingTimerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(BreathingTimerController());

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
        child: Column(
          children: [
            const SizedBox(
              height: 67,
            ),
            Obx(() {
              debugPrint("animate ${controller.progressValue.value}");
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                width: Get.width,
                height: 2,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: LinearProgressIndicator(
                    value: controller.progressValue.value,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(ColorApp.blue_container),
                    backgroundColor: ColorApp.grey_font,
                  ),
                ),
              );
            }),
            Container(
              margin: EdgeInsets.only(right: 20, top: 17),
              width: Get.width,
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  controller.timer.cancel();
                  Get.to(const BreathingFinishView());
                },
                child: const Text(
                  Strings.skip,
                  style: TextStyle(
                      color: ColorApp.blue_container,
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
              ),
            ),
            Expanded(
                child: Align(
              alignment: Alignment.center,
              child: Lottie.asset("assets/images/pulse_new.json"),
            ))
          ],
        ),
      ),
    );
  }
}

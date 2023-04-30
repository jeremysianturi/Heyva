import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../../constant/colors.dart';
import '../../../../../constant/strings.dart';
import '../../breathingfinish/views/breathing_finish_view.dart';
import '../controllers/breathing_timer_controller.dart';

class BreathingTimerView extends GetView<BreathingTimerController> {
  const BreathingTimerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  Padding(
                    padding: const EdgeInsets.only(top: 67),
                    child: GestureDetector(
                      onTap: () {
                        Get.to(const BreathingFinishView());
                      },
                      child: const Text(
                        Strings.skip,
                        style: TextStyle(
                            color: ColorApp.txt_white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
              Lottie.asset("assets/images/pulse_new.json"),
            ],
          ),
        ),
      ),
    );
  }
}

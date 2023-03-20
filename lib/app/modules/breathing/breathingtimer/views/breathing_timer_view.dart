import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:lottie/lottie.dart';
import '../../../../../constant/colors.dart';
import '../../../../../constant/strings.dart';
import '../../../../widgets/text_animation_from_bottom.dart';
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
              Lottie.asset("assets/images/breath.json"),
            ],
          ),
        ),
      ),
    );
  }
}

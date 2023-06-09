import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heyva/app/routes/app_pages.dart';
import 'package:heyva/app/widgets/reusable_header.dart';
import 'package:heyva/constant/colors.dart';
import 'package:heyva/constant/keys.dart';
import 'package:heyva/constant/strings.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../controllers/breathing_exercise_controller.dart';

class BreathingExerciseView extends GetView<BreathingExerciseController> {
  const BreathingExerciseView({Key? key}) : super(key: key);

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
            resizeToAvoidBottomInset: false,
            body: Container(
              height: Get.height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/bg_breating_exercise.png"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                children: [
                  Container(
                      margin: const EdgeInsets.only(top: 50),
                      child: const Header(
                        showIcon: false,
                        centerTitle: Strings.breathing_exercise,
                        showCenterTitle: true,
                      )),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 62, vertical: 40),
                    child: Column(
                      children: [
                        Obx(() {
                          return controller.imgAsset.value != ""
                              ? Image.asset(
                                  controller.imgAsset.value,
                                  width: 200,
                                  height: 200,
                                  fit: BoxFit.cover,
                                )
                              : SizedBox();
                        }),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          controller.greeting,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              color: ColorApp.black.withOpacity(0.3)),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          controller.desc1Breathing,
                          style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              color: ColorApp.blue_container),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            controller.createProgramPersonalTracker(
                                programId:
                                    controller.box.read(Keys.programIdStorage),
                                programIdChild: controller.box
                                    .read(Keys.programIdChildStorage));
                            Future.delayed(800.milliseconds);
                            if (controller.exercise == "1") {
                              Get.toNamed(Routes.BREATHING_EX_1);
                            }
                            if (controller.exercise == "2") {
                              Get.toNamed(Routes.BREATHING_EX_2);
                            }
                            if (controller.exercise == "3") {
                              Get.toNamed(Routes.BREATHING_EX_3);
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                ColorApp.btn_orange),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(14)),
                                side: BorderSide(color: ColorApp.btn_orange),
                              ),
                            ),
                          ),
                          child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 17, horizontal: 20),
                              child: Text(
                                Strings.begin,
                                style: TextStyle(
                                    color: ColorApp.arrow_white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700),
                                textAlign: TextAlign.center,
                              )),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ))));
  }
}

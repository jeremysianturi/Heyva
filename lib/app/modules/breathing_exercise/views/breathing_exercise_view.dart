import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:heyva/app/routes/app_pages.dart';
import 'package:heyva/app/widgets/reusable_header.dart';
import 'package:heyva/app/widgets/reusable_onboarding_header.dart';
import 'package:heyva/app/widgets/reusable_orange_button_with_trailing_icon.dart';
import 'package:heyva/constant/colors.dart';
import 'package:heyva/constant/strings.dart';

import '../controllers/breathing_exercise_controller.dart';

class BreathingExerciseView extends GetView<BreathingExerciseController> {
  const BreathingExerciseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Container(
            height: Get.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bg_breating_exercise.png"),
                fit: BoxFit.fill,
              ),
            ),
            child: Container(
              child: Column(
                children: [
                  Container(
                      margin: const EdgeInsets.only(top: 14),
                      child: const Header(
                        showIcon: false,
                        centerTitle: Strings.breathing_exercise,
                        showCenterTitle: true,
                      )),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 62),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Hi there 👋🏻",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: ColorApp.black.withOpacity(0.3)),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const Text(
                            "Here is a short deep breathing exercise step-by-step for managing your stress after birth:",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                                color: ColorApp.black_font_underline),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Get.toNamed(Routes.BREATHIN_VOICE);
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
                              )
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

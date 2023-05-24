import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heyva/app/widgets/reusable_header.dart';
import 'package:heyva/constant/keys.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../../../../constant/colors.dart';
import '../../../../../constant/strings.dart';
import '../controllers/breathing_one_controller.dart';

class BreathingOneView extends GetView<BreathingOneController> {
  const BreathingOneView({Key? key}) : super(key: key);

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
              child: Container(
                child: Column(
                  children: [
                    Container(
                        margin: const EdgeInsets.only(top: 50),
                        child: const Header(
                          showIcon: false,
                          centerTitle: Strings.pelvic_exercise,
                          showCenterTitle: true,
                        )),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 42),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Welcome to heyva",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  color: ColorApp.black.withOpacity(0.3)),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            const Text(
                              "Let’s start with a short exercise to help you get settled.",
                              style: TextStyle(
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
                                    programId: controller.box
                                        .read(Keys.programIdChildStorage));

                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        ColorApp.btn_orange),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(14)),
                                    side:
                                        BorderSide(color: ColorApp.btn_orange),
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
                    ),
                  ],
                ),
              ),
            ))));
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heyva/app/widgets/nav_screen.dart';
import 'package:heyva/app/widgets/reusable_orange_button_with_trailing_icon.dart';
import 'package:heyva/constant/colors.dart';
import 'package:heyva/constant/strings.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../controllers/breathing_finish_controller.dart';

class BreathingFinishView extends GetView<BreathingFinishController> {
  const BreathingFinishView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
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
                height: 17,
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
                      Strings.skip,
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
                          color: ColorApp.black_font_underline),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Aliquet est vulputate elit viverra. Consectetur nulla arcu aliquam sem nunc nunc. At dui lobortis dignissim in id tempus non.",
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
                    PersistentNavBarNavigator.pushNewScreen(
                      context,
                      screen: NavScreen(
                        menuScreenContext: context,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heyva/app/routes/app_pages.dart';
import 'package:heyva/app/widgets/reusable_header.dart';
import 'package:heyva/app/widgets/reusable_orange_button_with_trailing_icon.dart';
import 'package:heyva/constant/colors.dart';
import 'package:heyva/constant/strings.dart';

import '../controllers/mood_tracker_controller.dart';

class MoodTrackerView extends GetView<MoodTrackerController> {
  const MoodTrackerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Container(
            height: Get.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bg_heyva.png"),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              children: [
                Container(
                    margin: const EdgeInsets.only(top: 14),
                    child:
                        const Header(rightText: Strings.skip, showIcon: false)),
                const SizedBox(
                  height: 24,
                ),
                const Text(
                  Strings.welcomeMoodChecking,
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 28),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 26,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.asset("assets/images/bg_mood_tracker.png"),
                ),
                const SizedBox(
                  height: 24,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 30, right: 44),
                  child: Text(
                    Strings.welcomeMoodCheckingDesc,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: ColorApp.grey_font,
                        fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(child: Container()),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: OrangeButtonWTrailingIcon(
                    determineAction: "from_onplanning_one",
                    text: Strings.lets_go,
                    ontap: () {
                      Get.toNamed(Routes.PHYSICAL_CHECK);
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

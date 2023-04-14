import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heyva/app/widgets/nav_screen.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import '../../../../../constant/colors.dart';
import '../../../../../constant/strings.dart';
import '../controllers/breathing_one_controller.dart';

class BreathingOneView extends GetView<BreathingOneController> {
  const BreathingOneView({Key? key}) : super(key: key);

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
                  InkWell(
                    onTap: () {
                      Get.deleteAll();
                      pushNewScreen(
                        context,
                        screen: NavScreen(
                          menuScreenContext: context,
                        ),
                      );
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(top: 67),
                      child: Text(
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    Strings.welcome_heyva,
                    style: TextStyle(
                        color: ColorApp.text_input_bg,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    Strings.start_short_exercise,
                    style: TextStyle(
                        color: ColorApp.txt_white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          controller.getPelvic();
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              ColorApp.btn_orange),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(14)),
                              side: BorderSide(color: ColorApp.btn_orange),
                            ),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 14, horizontal: 30),
                          child: Text(
                            Strings.begin,
                            style: TextStyle(
                                color: ColorApp.arrow_white,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(),
            ],
          ),
        ),
      ),
    );
  }
}

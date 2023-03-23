import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:heyva/app/widgets/reusable_header.dart';
import 'package:heyva/app/widgets/reusable_onboarding_header.dart';
import 'package:heyva/constant/colors.dart';
import 'package:heyva/constant/strings.dart';

import '../controllers/breast_feeding_controller.dart';

class BreastFeedingView extends GetView<BreastFeedingController> {
  const BreastFeedingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            AspectRatio(
              aspectRatio: 375 / 390,
              child: Container(
                width: Get.width,
                alignment: Alignment.topCenter,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          'assets/images/bg_breast_feeding.png',
                        ),
                        fit: BoxFit.fitWidth)),
              ),
            ),
            Column(
              children: [
                Container(
                    margin: const EdgeInsets.only(top: 8),
                    child: const Header(
                      showCenterTitle: true,
                        centerTitle: Strings.excercise,
                        rightText: Strings.login,
                        showIcon: true)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

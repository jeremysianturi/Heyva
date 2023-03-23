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
        child: Column(
          children: [
            const Header(rightText: Strings.login, showIcon: true),
          ],
        ),
      ),
    );
  }
}

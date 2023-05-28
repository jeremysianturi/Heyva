import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heyva/app/widgets/nav_screen.dart';
import 'package:heyva/constant/colors.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import '../controllers/initial_page_controller.dart';

class InitialPageView extends GetView<InitialPageController> {
  const InitialPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(800.milliseconds, () {
      if (Get.isDialogOpen == true) {
        Get.back();
      }
      Get.deleteAll();
      pushNewScreen(
        context,
        screen: NavScreen(
          menuScreenContext: context,
        ),
      );
    });
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: ColorApp.btn_orange,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heyva/constant/colors.dart';
import 'package:heyva/constant/strings.dart';

import '../controllers/breathing_feelings_controller.dart';

class BreathingFeelingsView extends GetView<BreathingFeelingsController> {
  const BreathingFeelingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
              height: 60,
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
                    "",
                    // Strings.skip,
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 63,
                  ),
                  const Text(
                    Strings.wasThisSessiOneEfective,
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        color: ColorApp.blue_container,
                        fontSize: 24,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  // ListView.builder(
                  //   shrinkWrap: true,
                  //   scrollDirection: Axis.vertical,
                  //   itemCount: controller.list.length,
                  //   itemBuilder: (BuildContext context, int index) =>
                  //       BreatingFeelingsItems(
                  //     controller: controller,
                  //     index: index,
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BreatingFeelingsItems extends StatelessWidget {
  const BreatingFeelingsItems({
    super.key,
    required this.index,
    required this.title,
    required this.ontap,
  });

  final int index;
  final String title;
  final Function ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ontap();
      },
      child: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            color: ColorApp.btn_orange),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                    color: ColorApp.arrow_white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
              const ImageIcon(
                AssetImage("assets/icons/ic_arrow_right.png"),
                color: ColorApp.arrow_white,
              )
            ],
          ),
        ),
      ),
    );
  }
}

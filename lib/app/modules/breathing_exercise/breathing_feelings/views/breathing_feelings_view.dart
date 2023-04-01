import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:heyva/app/routes/app_pages.dart';
import 'package:heyva/app/widgets/reusable_orange_button_with_trailing_icon.dart';
import 'package:heyva/constant/colors.dart';
import 'package:heyva/constant/strings.dart';

import '../controllers/breathing_feelings_controller.dart';

class BreathingFeelingsView extends GetView<BreathingFeelingsController> {
  const BreathingFeelingsView({Key? key}) : super(key: key);

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
                          color: ColorApp.black_font_underline,
                          fontSize: 24,
                          fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: controller.list.length,
                      itemBuilder: (BuildContext context, int index) =>
                          BreatingFeelingsItems(
                        controller: controller,
                        index: index,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BreatingFeelingsItems extends StatelessWidget {
  const BreatingFeelingsItems({
    super.key,
    required this.controller,
    required this.index,
  });

  final BreathingFeelingsController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.BREATHING_FINISH);
      },
      child: Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 10),
        child: ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(ColorApp.btn_orange),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(14)),
                side: BorderSide(color: ColorApp.btn_orange),
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  controller.list[index],
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
      ),
    );
  }
}
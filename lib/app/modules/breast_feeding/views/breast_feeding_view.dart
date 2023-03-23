import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heyva/app/modules/breast_feeding/widget/video_item.dart';
import 'package:heyva/app/modules/breast_feeding/widget/video_player_view.dart';
import 'package:heyva/app/routes/app_pages.dart';
import 'package:heyva/app/widgets/reusable_header.dart';
import 'package:heyva/app/widgets/reusable_orange_button_with_trailing_icon.dart';
import 'package:heyva/constant/colors.dart';
import 'package:heyva/constant/strings.dart';

import '../controllers/breast_feeding_controller.dart';

class BreastFeedingView extends GetView<BreastFeedingController> {
  const BreastFeedingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
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
                  Padding(
                    padding: const EdgeInsets.only(top: 330),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: ColorApp.white,
                            ),
                            color: ColorApp.white,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Wrap(
                                      spacing: 8,
                                      children: controller.list
                                          .map(
                                            (e) => _buildChip(
                                                e.tag, ColorApp.btn_pink),
                                          )
                                          .toList(),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  "Mindful meditation exercise",
                                  style: TextStyle(
                                    color: ColorApp.black_font_underline,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "by Tamara Levit",
                                  style: TextStyle(
                                    color: ColorApp.black.withOpacity(0.3),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Vitae odio condimentum cursus pharetra proin urna tortor odio. Lacus sit vitae pretium tortor sit ac amet. Tellus accumsan ultricies porttitor mi lacus vel adipiscing pulvinar. Potenti nunc luctus.",
                                  style: TextStyle(
                                    color: ColorApp.black.withOpacity(0.3),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          color: ColorApp.white,
                          padding: EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    "How to do",
                                    style: TextStyle(
                                      color: ColorApp.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    "Play all",
                                    style: TextStyle(
                                      color: ColorApp.black,
                                      fontSize: 14,
                                      decoration: TextDecoration.underline,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: List.generate(
                                    4,
                                    (index) => VideoItem(
                                          index: index,
                                        )),
                              ),
                              Positioned(
                                bottom: 0,
                                child: Container(
                                  margin: EdgeInsets.only(top: 30),
                                  width: Get.width,
                                  child: OrangeButtonWTrailingIcon(
                                    padding: 0,
                                    determineAction: "from_onplanning_one",
                                    text: Strings.lets_go,
                                    ontap: () {
                                      Get.to(myVidePlayer());
                                    },
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildChip(String label, Color color) {
  return Chip(
    labelPadding: EdgeInsets.all(2.0),
    label: Text(
      label,
      style: const TextStyle(
        color: Colors.white,
      ),
    ),
    backgroundColor: color,
    elevation: 0,
    shadowColor: Colors.grey[60],
    padding: const EdgeInsets.all(8.0),
  );
}

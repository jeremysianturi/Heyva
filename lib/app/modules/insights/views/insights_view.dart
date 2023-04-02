import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heyva/app/modules/insights/widget/insight_mood_widget.dart';
import 'package:heyva/app/routes/app_pages.dart';
import 'package:heyva/constant/colors.dart';
import 'package:heyva/constant/strings.dart';

import '../controllers/insights_controller.dart';

class InsightsView extends GetView<InsightsController> {
  const InsightsView(
      {Key? key,
      required this.menuScreenContext,
      required this.onScreenHideButtonPressed,
      this.hideStatus = false})
      : super(key: key);
  final BuildContext menuScreenContext;
  final VoidCallback onScreenHideButtonPressed;
  final bool hideStatus;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/bg_heyva.png",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.fill,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            extendBodyBehindAppBar: false,
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    leading: GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.PROFILE);
                      },
                      child: CircleAvatar(
                        child: Image.asset("assets/images/img_pp_dummy.png"),
                      ),
                    ),
                    title: GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.PROFILE);
                      },
                      child: Column(
                        children: const [
                          Text(
                            Strings.good_afternoon,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: ColorApp.black_greeting_color,
                            ),
                          ),
                          Text(
                            Strings.priscilla,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: ColorApp.homepage_name_color,
                            ),
                          ),
                        ],
                      ),
                    ),
                    actions: [
                      GestureDetector(
                        onTap: () {
                          // Get.to(ArticleView());
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12.5, vertical: 10.5),
                          decoration: BoxDecoration(
                            color: ColorApp.bottom_nav_color,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const ImageIcon(
                            AssetImage("assets/images/ic_notification.png"),
                            color: ColorApp.ic_notif_color,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    Strings.daily_refresh,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: ColorApp.grey_font),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    Strings.congratsYourAchive,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: ColorApp.black_font_underline),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 1,
                                  width: Get.width,
                                  color: ColorApp.black,
                                ),
                              ),
                              const SizedBox(
                                width: 17,
                              ),
                              const Text(
                                "${Strings.pospatrumWeek}3",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: ColorApp.black_font_underline),
                              ),
                              const SizedBox(
                                width: 17,
                              ),
                              Expanded(
                                child: Container(
                                  height: 1,
                                  width: Get.width,
                                  color: ColorApp.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        const Text(
                          "03/02/2023",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: ColorApp.black_font_underline),
                        ),
                        Column(
                          children: List.generate(
                            3,
                            (index) => Container(
                              margin: const EdgeInsets.only(top: 24),
                              height: 390,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 3,
                                  itemBuilder:
                                      (BuildContext context, int index) =>
                                          const InsightMoodWidget()),
                            ),
                          ),
                        ),
                        const SizedBox(height: 90,),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}


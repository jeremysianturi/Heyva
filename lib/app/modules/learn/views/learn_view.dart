import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:heyva/app/modules/learn/Widget/folder_item_list.dart';
import 'package:heyva/app/modules/learn/Widget/heyva_course_list.dart';
import 'package:heyva/app/modules/learn/Widget/upcoming_wdget.dart';
import 'package:heyva/constant/colors.dart';

import '../controllers/learn_controller.dart';

class LearnView extends GetView<LearnController> {
  const LearnView(
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
    Get.lazyPut<LearnController>(
      () => LearnController(),
    );
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/bg_heyva2.png"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(
                        'assets/images/heyva_text_logo.svg',
                        fit: BoxFit.fill,
                        alignment: Alignment.centerLeft,
                        width: 60,
                        height: 20,
                      ),
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
                    height: 24,
                  ),
                  FolderItemList(controller: controller),
                  const SizedBox(
                    height: 24,
                  ),
                  HeyvaCourseList(),
                  const SizedBox(
                    height: 24,
                  ),
                  UpcomingWidget(),
                ],
              ),
            ),
          ),
        ));
  }
}



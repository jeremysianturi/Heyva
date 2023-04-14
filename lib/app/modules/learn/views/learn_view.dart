import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:heyva/app/modules/learn/Widget/folder_item_list.dart';
import 'package:heyva/app/modules/learn/Widget/upcoming_wdget.dart';
import 'package:heyva/constant/colors.dart';
import 'package:heyva/constant/strings.dart';

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
                            color: ColorApp.blue_container,
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
                  Text(
                    Strings.heyvaCourse,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                        color: ColorApp.homepage_name_color),
                  ),
                  SizedBox(height: 20,),
                  CarouselSlider(
                    options: CarouselOptions(
                        height: 108,
                        viewportFraction: 0.7,
                        disableCenter: true,
                        enableInfiniteScroll: false,
                        enlargeCenterPage: false,
                        padEnds: false
                        // aspectRatio: 16/9
                        ),
                    items: [1, 2, 3, 4, 5].map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Container(
                                // width: 188,
                                // margin: EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: const BoxDecoration(
                                    color: ColorApp.container_pink,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12))),
                                child: Card(
                                  elevation: 0,
                                  color: ColorApp.container_pink,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 12, top: 14, bottom: 12),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            IconButton(
                                              icon: Image.asset(
                                                  "assets/images/ic_program.png"),
                                              color: ColorApp.blue_container,
                                              padding: EdgeInsets.zero,
                                              constraints:
                                                  const BoxConstraints(),
                                              onPressed: () {},
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Text(
                                              Strings.program,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color:
                                                      ColorApp.blue_container),
                                            ),
                                          ],
                                        ),
                                        const Text(
                                          Strings.pelvic_session,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700,
                                              color: ColorApp.blue_container),
                                        ),
                                        const Text(
                                          Strings.one_ninety_days,
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: ColorApp.blue_container),
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                          );
                        },
                      );
                    }).toList(),
                  ),
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

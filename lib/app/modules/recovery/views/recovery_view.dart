import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:heyva/app/modules/related_program/widget/program_tab.dart';
import 'package:heyva/app/routes/app_pages.dart';
import 'package:heyva/app/widgets/reusable_article_container.dart';

import '../../../../constant/colors.dart';
import '../../../../constant/strings.dart';
import '../../../widgets/reusable_timeline.dart';
import '../controllers/recovery_controller.dart';

class RecoveryView extends GetView<RecoveryController> {
  const RecoveryView(
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
    Get.put(RecoveryController());
    return Obx(() => Stack(
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
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 64,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            Strings.heyva_capital,
                            style: TextStyle(
                              color: ColorApp.black_font,
                            ),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text(
                            Strings.start_your_day,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: ColorApp.grey_font),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TimelineView(
                        from: "recovery",
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text(
                            Strings.your_progress_day,
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: ColorApp.black_article_title),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12))),
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
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: ColorApp
                                                          .black_font_underline),
                                                ),
                                              ],
                                            ),
                                            const Text(
                                              Strings.pelvic_session,
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w700,
                                                  color: ColorApp.black),
                                            ),
                                            const Text(
                                              Strings.one_ninety_days,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                  color: ColorApp.black),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            Strings.related_program,
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: ColorApp.black_article_title),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.RELATED_PROGRAM);
                            },
                            child: const Text(
                              Strings.more,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: ColorApp.black_article_title),
                            ),
                          ),
                        ],
                      ),
                      // Wrap(
                      //   children: const [TabBarRecoveryProgram()],
                      // ),
                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        height: 30,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.tagList.length,
                          itemBuilder: (context, index) => ProgramTab(
                            index: index,
                            data: controller.tagList[index],
                            ontap: () {
                              controller.ontapProgramsTab(index: index);
                            },
                          ),
                        ),
                      ),
                      if (controller.programLength > 0)
                        GridView.count(
                          shrinkWrap: true,
                          crossAxisCount: 2,
                          childAspectRatio: 162 / 260,
                          crossAxisSpacing: 11,
                          mainAxisSpacing: 0,
                          physics: const NeverScrollableScrollPhysics(),
                          children:
                              List.generate(controller.programLength, (i) {
                            var data =
                                controller.contentListResponse.value.data?[i];
                            return ArticleContainer(
                              containerColor: ColorApp.blue_container,
                              title: data?.contents?.title ?? "",
                              tag: data?.contentType?.name ?? "",
                              tagIcon: "assets/images/ic_bookmark.png",
                              desc: data?.contents?.body.toString() == "null"
                                  ? data?.contents?.renderedBody ?? ""
                                  : data?.contents?.body ?? "",
                              contentId: data?.contents?.id ?? "",
                              contentType: data?.contentType?.name ?? "",
                            );
                          }),
                        ),
                      ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          Card(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14.0),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14.0),
                                image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      "assets/images/bg_blue_container_medal.png"),
                                ),
                              ),
                              child: const ListTile(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(14))),
                                title: Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: Text(
                                    Strings.to_keep_you_entertain,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: ColorApp.white_font),
                                  ),
                                ),
                                subtitle: Padding(
                                  padding: EdgeInsets.only(bottom: 20),
                                  child: Text(
                                    Strings.invite_your_friends,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: ColorApp.grey_card_font),
                                  ),
                                ),
                                trailing: Icon(
                                  Icons.arrow_forward_ios,
                                  color: ColorApp.white_font,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 100,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

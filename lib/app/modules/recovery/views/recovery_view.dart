import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:heyva/app/modules/learn/views/learn_view.dart';
import 'package:heyva/app/modules/related_program/widget/program_tab.dart';
import 'package:heyva/app/routes/app_pages.dart';
import 'package:heyva/app/widgets/reusable_article_container.dart';
import 'package:loading_overlay/loading_overlay.dart';

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
    return Obx(() => LoadingOverlay(
        isLoading: controller.isLoading.value,
        color: Colors.grey,
        progressIndicator: const CircularProgressIndicator(
          color: ColorApp.btn_orange,
        ),
        opacity: 0.3,
        child: Stack(
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
                body: Column(
                  children: [
                    AppBar(
                      systemOverlayStyle: const SystemUiOverlayStyle(
                        statusBarIconBrightness: Brightness.dark,
                        statusBarBrightness:
                            Brightness.light, // For iOS (dark icons)
                      ),
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      centerTitle: false,
                      leading: SvgPicture.asset(
                        'assets/images/heyva_text_logo.svg',
                        fit: BoxFit.fitWidth,
                        alignment: Alignment.centerLeft,
                        width: 60,
                        height: 20,
                      ),
                      actions: [
                        GestureDetector(
                          onTap: () {
                            // Get.to(ArticleView());
                            Get.toNamed(Routes.NOTIFICATION_CENTER);
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
                      height: 10,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
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
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Text(
                                  Strings.your_progress_day,
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                      color: ColorApp.blue_container),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Obx(() => CarouselSlider(
                                  options: CarouselOptions(
                                      height: 108,
                                      viewportFraction: 0.7,
                                      disableCenter: true,
                                      enableInfiniteScroll: false,
                                      enlargeCenterPage: false,
                                      padEnds: false
                                      // aspectRatio: 16/9
                                      ),
                                  items: List.generate(
                                      controller.programListResponse.value.data
                                              ?.length ??
                                          0, (index) {
                                    var data = controller
                                        .programListResponse.value.data?[index];
                                    return CourseItem(
                                        type: data?.title ?? "",
                                        title: data?.body ?? "",
                                        days: index == 0
                                            ? "${data?.dailyProgress} Progress"
                                            : "${data?.daysCount} Days",
                                        programId: data?.id ?? "",
                                        programIdChild: data?.dailyProgress ==
                                                '0/3'
                                            ? data?.child![0].id ?? ""
                                            : data?.dailyProgress == '1/3'
                                                ? data?.child![1].id ?? ""
                                                : data?.dailyProgress == '2/3'
                                                    ? data?.child![2].id ?? ""
                                                    : data?.id ?? "");
                                  }),
                                )),
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
                                      color: ColorApp.blue_container),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed(Routes.RELATED_PROGRAM);
                                  },
                                  child: const Text(
                                    Strings.seeMore,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: ColorApp.blue_container),
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
                            Container(
                              height: 30,
                              child: ListView.builder(
                                shrinkWrap: true,
                                padding: EdgeInsets.zero,
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
                            const SizedBox(
                              height: 28,
                            ),
                            if (controller.programLength > 0)
                              GridView.count(
                                shrinkWrap: true,
                                padding: EdgeInsets.zero,
                                crossAxisCount: 2,
                                childAspectRatio: 162 / 260,
                                crossAxisSpacing: 11,
                                mainAxisSpacing: 0,
                                physics: const NeverScrollableScrollPhysics(),
                                children: List.generate(
                                    controller.programLength, (i) {
                                  var data = controller
                                      .contentListResponse.value.data?[i];
                                  return ArticleContainer(
                                    containerColor: ColorApp.blue_container,
                                    title: data?.contents?.title ?? "",
                                    tag: data?.contentType?.name ?? "",
                                    tagIcon: "assets/images/ic_bookmark.png",
                                    desc: controller.parseHtmlString(
                                        data?.contents!.body ?? ""),
                                    contentId: data?.contents?.id ?? "",
                                    contentType: data?.contentType?.name ?? "",
                                    thumbnailUrl:
                                        data?.contents?.thumbnail ?? "",
                                  );
                                }),
                              ),
                            ListView(
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
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
                                    child: ListTile(
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(14))),
                                      title: Padding(
                                        padding: const EdgeInsets.only(top: 20),
                                        child: Text(
                                          Strings.to_keep_you_entertain,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                              color: ColorApp.white_font
                                                  .withOpacity(0.6)),
                                        ),
                                      ),
                                      subtitle: const Padding(
                                        padding: EdgeInsets.only(bottom: 20),
                                        child: Text(
                                          Strings.invite_your_friends,
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: ColorApp.grey_card_font),
                                        ),
                                      ),
                                      trailing: const Icon(
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
                  ],
                ),
              ),
            ),
          ],
        )));
  }
}

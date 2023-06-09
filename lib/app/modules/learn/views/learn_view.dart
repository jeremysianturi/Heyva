import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heyva/app/modules/learn/Widget/folder_item_list.dart';
import 'package:heyva/app/modules/learn/Widget/upcoming_wdget.dart';
import 'package:heyva/app/routes/app_pages.dart';
import 'package:heyva/constant/colors.dart';
import 'package:heyva/constant/keys.dart';
import 'package:heyva/constant/strings.dart';
import 'package:loading_overlay/loading_overlay.dart';

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
    return Obx(() => LoadingOverlay(
        isLoading: controller.isLoading.value,
        color: Colors.grey,
        progressIndicator: const CircularProgressIndicator(
          color: ColorApp.btn_orange,
        ),
        opacity: 0.3,
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/bg_heyva2.png"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: AppBar(
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
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Expanded(
                      child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 12,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: FolderItemList(controller: controller),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            Strings.heyvaCourse,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 24,
                                color: ColorApp.blue_container),
                          ),
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
                                  index: index,
                                  type: data?.title ?? "",
                                  title: data?.body ?? "",
                                  days: index == 0
                                      ? "${data?.dailyProgress} Progress"
                                      : "${data?.daysCount} Days",
                                  programId: data?.id ?? "",
                                  programIdChild: data?.dailyProgress == '0/3'
                                      ? data?.child![0].id ?? ""
                                      : data?.dailyProgress == '1/3'
                                          ? data?.child![1].id ?? ""
                                          : data?.dailyProgress == '2/3'
                                              ? data?.child![2].id ?? ""
                                              : data?.id ?? "",
                                );
                              }),
                            )),
                        const SizedBox(
                          height: 24,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: UpcomingWidget(),
                        ),
                      ],
                    ),
                  )),
                ],
              ),
            ))));
  }
}

class CourseItem extends StatelessWidget {
  const CourseItem({
    super.key,
    required this.type,
    required this.title,
    required this.days,
    required this.programId,
    required this.programIdChild,
    required this.index,
  });

  final String type, title, days, programId, programIdChild;
  final int index;

  @override
  Widget build(BuildContext context) {
    bool isDone = days.contains("3/3") || days.contains("90/90");
    return GestureDetector(
      onTap: () {
        if (isDone == false) {
          var box = GetStorage();
          box.write(Keys.programIdStorage, programId);
          box.write(Keys.programIdChildStorage, programIdChild);
          if (type.toLowerCase().contains("breathin")) {
            var exercise = "0";
            if (days.contains("0/3")) {
              exercise = "1";
            }
            if (days.contains("1/3")) {
              exercise = "2";
            }
            if (days.contains("2/3")) {
              exercise = "3";
            }
            box.write(Keys.exerciseOngoing, exercise.toString());

            Get.toNamed(Routes.BREATHING_EXERCISE,
                arguments: {Keys.ardoExercise: exercise});
          }
          if (type.toLowerCase().contains("pelvic")) {
            Get.toNamed(
              Routes.BREATHING_ONE,
            );
          }
        }
      },
      child: Padding(
        padding: EdgeInsets.only(right: 10, left: index == 0 ? 20 : 0),
        child: Container(
            // width: 188,
            // margin: EdgeInsets.symmetric(horizontal: 5.0),
            decoration: BoxDecoration(
                color: isDone ? ColorApp.btn_maroon : ColorApp.container_pink,
                borderRadius: const BorderRadius.all(Radius.circular(12))),
            child: Card(
              elevation: 0,
              color: isDone ? ColorApp.btn_maroon : ColorApp.container_pink,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 12, top: 14, bottom: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // IconButton(
                        //   icon: Image.asset("assets/images/ic_program.png"),
                        //   color: isDone
                        //       ? ColorApp.txt_white
                        //       : ColorApp.blue_container,
                        //   padding: EdgeInsets.zero,
                        //   constraints: const BoxConstraints(),
                        //   onPressed: () {},
                        // ),
                        SvgPicture.asset(
                          "assets/images/ic_program.svg",
                          color: isDone
                              ? ColorApp.txt_white
                              : ColorApp.blue_container,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          type,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: isDone
                                  ? ColorApp.txt_white
                                  : ColorApp.blue_container),
                        ),
                      ],
                    ),
                    Text(
                      title,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: isDone
                              ? ColorApp.txt_white
                              : ColorApp.blue_container),
                    ),
                    Text(
                      days,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: isDone
                              ? ColorApp.txt_white
                              : ColorApp.blue_container),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}

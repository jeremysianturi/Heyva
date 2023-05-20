import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:heyva/app/modules/insights/model/Insight_model.dart' as insight;
import 'package:heyva/app/modules/insights/widget/insight_mood_widget.dart';
import 'package:heyva/app/routes/app_pages.dart';
import 'package:heyva/constant/colors.dart';
import 'package:heyva/constant/strings.dart';
import 'package:loading_overlay/loading_overlay.dart';

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
    Get.put(InsightsController());
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
            Scaffold(
              backgroundColor: Colors.transparent,
              extendBodyBehindAppBar: false,
              body: Column(
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
                      leading: GestureDetector(
                        onTap: () async {
                          await Get.toNamed(Routes.PROFILE);
                          controller.onInit();
                        },
                        child:  CachedNetworkImage(
                          imageUrl: controller.profileAvatar,
                          placeholder: (context, url) =>  const Padding(
                            padding: EdgeInsets.all(10),
                            child: CircularProgressIndicator(
                              color: ColorApp.btn_orange,
                            ),
                          ),
                          imageBuilder: (context, image) => CircleAvatar(
                            backgroundImage: image,
                            radius: 150,
                          ),
                          errorWidget: (context, url, error) => const Icon(Icons.error),
                        ),
                      ),
                      title: GestureDetector(
                        onTap: () async {
                          await Get.toNamed(Routes.PROFILE);
                          controller.onInit();
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.greeting,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: ColorApp.black_greeting_color,
                              ),
                            ),
                            Text(
                              controller.profileName,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: ColorApp.blue_container,
                              ),
                            ),
                          ],
                        ),
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
                  Expanded(
                      child: Align(
                    alignment: controller.isEmptyInsight
                        ? Alignment.center
                        : Alignment.topCenter,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 24,
                          ),
                          controller.isEmptyInsight
                              ? const EmptyState(data: null)
                              : Column(
                                  children: List.generate(
                                      controller.insightResponse.value.data
                                              ?.length ??
                                          0,
                                      (index) => insightItem(
                                            controller: controller,
                                            data: controller.insightResponse
                                                .value.data?[index],
                                          )),
                                ),
                          const SizedBox(
                            height: 90,
                          ),
                        ],
                      ),
                    ),
                  ))
                ],
              ),
            ),
          ],
        )));
  }
}

class insightItem extends StatelessWidget {
  const insightItem({
    super.key,
    required this.controller,
    required this.data,
  });

  final InsightsController controller;
  final insight.Data? data;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              data?.insightDate ?? "",
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: ColorApp.blue_container),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          data?.insight?.length == 0
              ? EmptyState(data: data)
              : CarouselSlider(
                  options: CarouselOptions(
                    height: 700,
                    // aspectRatio: 310 / 360,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: false,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    // autoPlayCurve: Curves.fastOutSlowIn,
                    // enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    onPageChanged: (index, reason) {
                      controller.currentIndex.value = index + 1;
                    },
                    scrollDirection: Axis.horizontal,
                  ),
                  // options: CarouselOptions(height: 400.0),
                  items: data?.insight?.map((i) {
                    return Opacity(
                        // opacity: controller.currentIndex.value == i ? 1 : 0.5,
                        opacity: 1,
                        child: InsightMoodWidget(
                          data: i,
                        ));
                  }).toList(),
                ),
        ],
      ),
    );
  }
}

class EmptyState extends StatelessWidget {
  const EmptyState({
    super.key,
    required this.data,
  });

  final insight.Data? data;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      margin: const EdgeInsets.symmetric(horizontal: 44, vertical: 30),
      child: Column(
        children: [
          SvgPicture.asset(
            "assets/icons/ic_empty_insight.svg",
          ),
          const SizedBox(
            height: 17,
          ),
          data == null
              ? const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    Strings.txtEmptyAllInsight,
                    style: TextStyle(
                        fontSize: 20,
                        color: ColorApp.blue_container,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                )
              : RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: const TextStyle(fontSize: 20),
                    children: [
                      const TextSpan(
                        text: Strings.textUpperEmptyInsight,
                        style: TextStyle(
                            color: ColorApp.blue_container,
                            fontWeight: FontWeight.w500),
                      ),
                      TextSpan(
                        text: data?.insightDate ?? "",
                        style: const TextStyle(
                            color: ColorApp.blue_container,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w500),
                      ),
                      const TextSpan(
                        text: Strings.txtdownEmptySyInsight,
                        style: TextStyle(
                            color: ColorApp.blue_container,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
          const SizedBox(
            height: 17,
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.MOOD_TRACKER);
                },
                child: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(14)),
                      color: ColorApp.btn_orange),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    child: Text(
                      Strings.startNow,
                      style: TextStyle(
                          color: ColorApp.arrow_white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              )
            ],
          )
        ],
      ),
    );
  }
}

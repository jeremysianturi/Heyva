import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:heyva/app/routes/app_pages.dart';
import 'package:heyva/app/widgets/nav_screen.dart';
import 'package:heyva/app/widgets/reusable_header.dart';
import 'package:heyva/app/widgets/reusable_orange_button_with_trailing_icon.dart';
import 'package:heyva/constant/colors.dart';
import 'package:heyva/constant/keys.dart';
import 'package:heyva/constant/strings.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../controllers/recomendation2_controller.dart';

class Recomendation2View extends GetView<Recomendation2Controller> {
  const Recomendation2View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => LoadingOverlay(
        isLoading: controller.isLoading.value,
        color: Colors.grey,
        progressIndicator: const CircularProgressIndicator(
          color: ColorApp.btn_orange,
        ),
        opacity: 0.3,
        child: SafeArea(
          child: Scaffold(
            body: Container(
              height: Get.height,
              width: Get.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/bg_heyva.png"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                children: [
                  Container(
                      margin: const EdgeInsets.only(top: 14),
                      child: const Header(
                          showCenterTitle: true,
                          centerTitle: Strings.recomendation,
                          rightText: Strings.skip,
                          showIcon: true)),
                  const SizedBox(
                    height: 24,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "More relevant articles",
                      style: TextStyle(
                          color: ColorApp.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 28),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      "Based on your result, here are some recommendations our healthcare professionals have curated for you.",
                      style: TextStyle(
                          color: ColorApp.grey_font,
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GridView.custom(
                      shrinkWrap: true,
                      gridDelegate: SliverQuiltedGridDelegate(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        repeatPattern: QuiltedGridRepeatPattern.inverted,
                        pattern: [
                          const QuiltedGridTile(1, 2),
                          const QuiltedGridTile(1, 1),
                        ],
                      ),
                      childrenDelegate: SliverChildBuilderDelegate(
                          childCount: controller
                                  .recomendationResponse.value.data?.length ??
                              0, (context, index) {
                        debugPrint(
                            "recomendation response length ${controller.recomendationResponse.value.data?.length}");

                        var data =
                            controller.recomendationResponse.value.data?[index];
                        return RecomendationWidget(
                          bg: ColorApp.btn_pink,
                          height: 200,
                          marRight: 0,
                          marleft: 0,
                          title: data?.contents?.title ?? "",
                          subtitle: data?.contents?.body ?? "",
                          contentType: data?.contentType?.name ?? "",
                          imgUrl: data?.contents?.thumbnail ?? "",
                          contentId: data?.contents?.id ?? "",
                        );
                      }),
                    ),
                  )),
                  OrangeButtonWTrailingIcon(
                    determineAction: "ontap",
                    text: Strings.thankYou,
                    ontap: () {
                      PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: NavScreen(
                          menuScreenContext: context,
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        )));
  }
}

class RecomendationWidget extends StatelessWidget {
  RecomendationWidget({
    super.key,
    required this.bg,
    required this.height,
    this.marRight = 20.0,
    this.marleft = 20.0,
    required this.title,
    required this.subtitle,
    required this.contentType,
    required this.imgUrl,
    required this.contentId,
  });

  final Color bg;
  final double height;
  double marRight = 20.0, marleft = 20;
  final String title, subtitle, contentType, imgUrl, contentId;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (contentType.toLowerCase() == "video") {
          Get.toNamed(Routes.BREAST_FEEDING,
              arguments: {Keys.videoIdBreastFeedingArgumets: contentId});
        }
        if (contentType.toLowerCase() == "article") {
          Get.toNamed(Routes.ARTICLE,
              arguments: {Keys.contentIDArticleArguments: contentId});
        }
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: EdgeInsets.only(left: marleft, right: marRight),
        width: Get.width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            color: bg,
            image: DecorationImage(
                image: NetworkImage(imgUrl), fit: BoxFit.cover)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                  color: ColorApp.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 20),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              subtitle,
              style: const TextStyle(
                  color: ColorApp.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 14),
            ),
            const Expanded(child: SizedBox()),
            Row(
              children: [
                SvgPicture.asset(
                    contentType.toLowerCase().contains("program") ||
                            contentType.toLowerCase().contains("video")
                        ? 'assets/icons/ic_sound.svg'
                        : 'assets/icons/ic_article.svg'),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  contentType,
                  style: const TextStyle(
                      color: ColorApp.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 14),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

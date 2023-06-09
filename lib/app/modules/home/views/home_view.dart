import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:heyva/app/modules/home/widget/doctor_card.dart';
import 'package:heyva/app/routes/app_pages.dart';
import 'package:heyva/app/widgets/bottom_sheet_invite.dart';
import 'package:heyva/app/widgets/reusable_timeline.dart';
import 'package:heyva/constant/colors.dart';
import 'package:heyva/constant/strings.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../../widgets/reusable_article_container.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView(
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
    Get.put(HomeController());
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
                extendBodyBehindAppBar: false,
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    AppBar(
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
                            controller.getProfile();
                          },
                          child: CachedNetworkImage(
                              imageUrl: controller.profileAvatar,
                              placeholder: (context, url) => const Padding(
                                    padding: EdgeInsets.all(10),
                                    child: CircularProgressIndicator(
                                      color: ColorApp.btn_orange,
                                    ),
                                  ),
                              imageBuilder: (context, image) => CircleAvatar(
                                    backgroundImage: image,
                                    radius: 150,
                                  ),
                              errorWidget: (context, url, error) =>
                                  const CircleAvatar(
                                    backgroundColor: ColorApp.blue_container,
                                    radius: 150,
                                  ))),
                      title: GestureDetector(
                        onTap: () async {
                          await Get.toNamed(Routes.PROFILE);
                          controller.getProfile();
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
                            TimelineView(
                              from: "home",
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  Strings.related,
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                      color: ColorApp.blue_container),
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.toNamed(Routes.RELATED_PROGRAM);
                                  },
                                  child: const Text(
                                    Strings.seeMore,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: ColorApp.blue_container),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            // GridView.count(
                            //   shrinkWrap: true,
                            //   padding: const EdgeInsets.all(4.1),
                            //   crossAxisCount: 2,
                            //   childAspectRatio: 0.556,
                            //   crossAxisSpacing: 11,
                            //   mainAxisSpacing: 0,
                            //   physics: const NeverScrollableScrollPhysics(),
                            //   children:
                            //       List.generate(controller.programLength, (i) {
                            //     var data = controller
                            //         .contentListResponse.value.data?[i];
                            //     return ArticleContainer(
                            //       containerColor: ColorApp.blue_container,
                            //       title: data?.contents?.title ?? "",
                            //       tag: data?.contentType?.name ?? "",
                            //       tagIcon: "",
                            //       // tagIcon: "assets/images/ic_bookmark.png",
                            //       desc: controller.parseHtmlString(
                            //           data?.contents!.body ?? ""),
                            //       contentId: data?.contents?.id ?? "",
                            //       contentType: data?.contentType?.name ?? "",
                            //       thumbnailUrl: data?.contents?.thumbnail ?? "",
                            //     );
                            //   }),
                            // ),

                            Obx(() {
                              var data =
                                  controller.contentListResponse.value.data;
                              var lengt = controller
                                      .contentListResponse.value.data?.length ??
                                  0;
                              return lengt > 2
                                  ? Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                            child: ArticleContainer(
                                          containerColor:
                                              ColorApp.blue_container,
                                          title: data?[0].contents?.title ?? "",
                                          tag: data?[0].contentType?.name ?? "",
                                          tagIcon: "",
                                          // tagIcon: "assets/images/ic_bookmark.png",
                                          desc: controller.parseHtmlString(
                                              data?[0].contents!.body ?? ""),
                                          contentId:
                                              data?[0].contents?.id ?? "",
                                          contentType:
                                              data?[0].contentType?.name ?? "",
                                          thumbnailUrl:
                                              data?[0].contents?.thumbnail ??
                                                  "",
                                        )),
                                        const SizedBox(
                                          width: 11,
                                        ),
                                        lengt >= 2
                                            ? Expanded(
                                                child: ArticleContainer(
                                                containerColor:
                                                    ColorApp.blue_container,
                                                title:
                                                    data?[1].contents?.title ??
                                                        "",
                                                tag: data?[1]
                                                        .contentType
                                                        ?.name ??
                                                    "",
                                                tagIcon: "",
                                                // tagIcon: "assets/images/ic_bookmark.png",
                                                desc: controller
                                                    .parseHtmlString(data?[1]
                                                            .contents!
                                                            .body ??
                                                        ""),
                                                contentId:
                                                    data?[1].contents?.id ?? "",
                                                contentType: data?[1]
                                                        .contentType
                                                        ?.name ??
                                                    "",
                                                thumbnailUrl: data?[1]
                                                        .contents
                                                        ?.thumbnail ??
                                                    "",
                                              ))
                                            : const Expanded(child: SizedBox())
                                      ],
                                    )
                                  : const SizedBox();
                            }),
                            const SizedBox(
                              height: 24,
                            ),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      Strings.recommendation,
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w600,
                                          color: ColorApp.blue_container),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                Obx(
                                  () => ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    padding: EdgeInsets.zero,
                                    itemCount: controller.doctorLength,
                                    itemBuilder: (c, i) {
                                      var data = controller
                                          .doctorListResponse.value.data?[i];
                                      return DoctorCard(
                                        data: data,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 28,
                            ),
                            ListView(
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              physics: const NeverScrollableScrollPhysics(),
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    inviteFriends();
                                  },
                                  child: Container(
                                      width: Get.width,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 14),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(14.0),
                                        image: const DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              "assets/images/bg_blue_container_medal.png"),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                const Text(
                                                  Strings.share_to_friends,
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color:
                                                          ColorApp.white_font),
                                                ),
                                                const SizedBox(
                                                  height: 8,
                                                ),
                                                Text(
                                                  Strings.invite_your_friends,
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: ColorApp
                                                          .grey_card_font
                                                          .withOpacity(0.6)),
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 80,
                                          ),
                                          Container(
                                            child: const Icon(
                                              Icons.arrow_forward_ios,
                                              color: ColorApp.white_font,
                                            ),
                                          ),
                                        ],
                                      )),
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

  List<Step> buildStep() {
    return [
      Step(
          title: Container(
            height: 30,
            color: Colors.transparent,
            child: Container(
                decoration: const BoxDecoration(
                  color: ColorApp.btn_pink,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: const Center(
                  child: Text("Hi modal sheet"),
                )),
          ),
          content: Container(),
          isActive: controller.currentSteps.value >= 0,
          state: controller.currentSteps.value > 0
              ? StepState.complete
              : StepState.indexed),
      Step(
          title: Container(
            height: 30,
            color: Colors.transparent,
            child: Container(
                decoration: const BoxDecoration(
                  color: ColorApp.btn_pink,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: const Center(
                  child: Text("Hi modal sheet2"),
                )),
          ),
          content: Container(),
          isActive: controller.currentSteps.value >= 1,
          state: controller.currentSteps.value > 1
              ? StepState.complete
              : StepState.indexed),
      Step(
          title: Container(
            height: 30,
            color: Colors.transparent,
            child: Container(
                decoration: const BoxDecoration(
                  color: ColorApp.btn_pink,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: const Center(
                  child: Text("Hi modal sheet3"),
                )),
          ),
          content: Container(),
          isActive: controller.currentSteps.value >= 2,
          state: controller.currentSteps.value > 2
              ? StepState.complete
              : StepState.indexed),
    ];
  }
}

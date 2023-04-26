import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:heyva/app/modules/home/widget/doctor_card.dart';
import 'package:heyva/app/routes/app_pages.dart';
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
                // appBar: AppBar(
                //   backgroundColor: Colors.transparent,
                //   elevation: 0,
                //   leading: CircleAvatar(
                //     child: Image.asset("assets/images/img_pp_dummy.png"),
                //   ),
                //   title: Column(
                //     children: const [
                //       Text(
                //         Strings.good_afternoon,
                //         style: TextStyle(
                //           fontSize: 14,
                //           fontWeight: FontWeight.w400,
                //           color: ColorApp.black_greeting_color,
                //         ),
                //       ),
                //       Text(
                //         Strings.priscilla,
                //         style: TextStyle(
                //           fontSize: 18,
                //           fontWeight: FontWeight.w600,
                //           color: ColorApp.homepage_name_color,
                //         ),
                //       ),
                //     ],
                //   ),
                //   actions: [
                //     GestureDetector(
                //       onTap: () {
                //         Get.to(ArticleView());
                //       },
                //       child: Container(
                //         padding: const EdgeInsets.symmetric(
                //             horizontal: 12.5, vertical: 10.5),
                //         decoration: BoxDecoration(
                //           color: ColorApp.bottom_nav_color,
                //           borderRadius: BorderRadius.circular(12),
                //         ),
                //         child: const ImageIcon(
                //           AssetImage("assets/images/ic_notification.png"),
                //           color: ColorApp.ic_notif_color,
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                body: SingleChildScrollView(
                  child: Column(
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
                            controller.onInit();
                          },
                          child: CircleAvatar(
                            backgroundImage:
                                NetworkImage(controller.profileAvatar),
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
                        height: 24,
                      ),
                      const Text(
                        Strings.daily_refresh,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: ColorApp.grey_font),
                      ),
                      // Obx(
                      //   () => Stepper(
                      //     type: StepperType.vertical,
                      //     steps: buildStep(),
                      //     currentStep: homeController.currentSteps.value,
                      //     onStepContinue: () {
                      //       if (homeController.currentSteps.value ==
                      //           buildStep().length - 1) {
                      //       } else {
                      //         homeController.currentSteps.value++;
                      //       }
                      //     },
                      //     onStepCancel: () {
                      //       if (homeController.currentSteps.value == 0) {
                      //       } else {
                      //         homeController.currentSteps.value--;
                      //       }
                      //     },
                      //     onStepTapped: (index) {
                      //       homeController.currentSteps.value = index;
                      //     },
                      //     controlsBuilder:
                      //         (BuildContext context, ControlsDetails details) {
                      //       return Row(
                      //         children: <Widget>[
                      //           TextButton(
                      //             onPressed: details.onStepContinue,
                      //             child: const Text(
                      //               '',
                      //               style: TextStyle(color: Colors.transparent),
                      //             ),
                      //           ),
                      //           TextButton(
                      //             onPressed: details.onStepCancel,
                      //             child: const Text(
                      //               '',
                      //               style: TextStyle(color: Colors.transparent),
                      //             ),
                      //           ),
                      //         ],
                      //       );
                      //     },
                      //   ),
                      // ),
                      TimelineView(
                        from: "home",
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
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: ColorApp.blue_container),
                            ),
                          ),
                        ],
                      ),
                      GridView.count(
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        childAspectRatio: 162 / 260,
                        crossAxisSpacing: 11,
                        mainAxisSpacing: 0,
                        physics: const NeverScrollableScrollPhysics(),
                        children: List.generate(controller.programLength, (i) {
                          var data =
                              controller.contentListResponse.value.data?[i];
                          return ArticleContainer(
                            containerColor: ColorApp.blue_container,
                            title: data?.contents?.title ?? "",
                            tag: data?.contentType?.name ?? "",
                            tagIcon: "assets/images/ic_bookmark.png",
                            desc: data?.contents?.body.toString() == "null"
                                ? data?.contents?.body ?? ""
                                : data?.contents?.body ?? "",
                            contentId: data?.contents?.id ?? "",
                            contentType: data?.contentType?.name ?? "",
                            thumbnailUrl: data?.contents?.thumbnail ?? "",
                          );
                        }),
                      ),

                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     const ArticleContainer(
                      //       containerColor: ColorApp.blue_container,
                      //       title: Strings.managing_anxiety,
                      //       tag: Strings.articles,
                      //       tagIcon: "assets/images/ic_bookmark.png",
                      //       desc: Strings.desc_related_article,
                      //     ),
                      //     Container(),
                      //     const ArticleContainer(
                      //       containerColor: ColorApp.btn_maroon,
                      //       title: Strings.managing_anxiety,
                      //       tag: Strings.program,
                      //       tagIcon: "assets/images/ic_program.png",
                      //       desc: Strings.desc_related_article,
                      //     ),
                      //   ],
                      // ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                Strings.recommendation,
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    color: ColorApp.blue_container),
                              ),
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.end,
                              //   children: [
                              //     SizedBox(
                              //       // width: 70,
                              //       child: Row(
                              //         mainAxisAlignment:
                              //             MainAxisAlignment.start,
                              //         children: [
                              //           const Text(
                              //             Strings.view_all,
                              //             style: TextStyle(
                              //                 fontSize: 14,
                              //                 fontWeight: FontWeight.w400,
                              //                 color: ColorApp.black_view_all),
                              //           ),
                              //           IconButton(
                              //             // icon: Image.asset(tagIcon),
                              //             icon: const Icon(
                              //               Icons.arrow_forward_ios,
                              //               size: 12,
                              //             ),
                              //             padding: EdgeInsets.zero,
                              //             constraints: const BoxConstraints(),
                              //             onPressed: () {},
                              //           ),
                              //         ],
                              //       ),
                              //     ),
                              //   ],
                              // ),
                            ],
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Obx(
                            () => ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
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
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          // Card(
                          //   elevation: 0,
                          //   shape: RoundedRectangleBorder(
                          //     borderRadius: BorderRadius.circular(14.0),
                          //   ),
                          //   child: Container(
                          //     decoration: BoxDecoration(
                          //       borderRadius: BorderRadius.circular(14.0),
                          //       image: const DecorationImage(
                          //         fit: BoxFit.cover,
                          //         image: AssetImage(
                          //             "assets/images/bg_blue_container_medal.png"),
                          //       ),
                          //     ),
                          //     child: ListTile(
                          //       shape: const RoundedRectangleBorder(
                          //           borderRadius:
                          //               BorderRadius.all(Radius.circular(14))),
                          //       title: const Padding(
                          //         padding: EdgeInsets.only(top: 20),
                          //         child: Text(
                          //           Strings.get_your_premium,
                          //           style: TextStyle(
                          //               fontSize: 20,
                          //               fontWeight: FontWeight.w500,
                          //               color: ColorApp.white_font),
                          //         ),
                          //       ),
                          //       subtitle: Padding(
                          //         padding: const EdgeInsets.only(bottom: 20),
                          //         child: Text(
                          //           Strings.get_unlimited_access,
                          //           style: TextStyle(
                          //               fontSize: 14,
                          //               fontWeight: FontWeight.w400,
                          //               color: ColorApp.grey_card_font
                          //                   .withOpacity(0.6)),
                          //         ),
                          //       ),
                          //       trailing: const Icon(
                          //         Icons.arrow_forward_ios,
                          //         color: ColorApp.white_font,
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          // const SizedBox(
                          //   height: 10,
                          // ),
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
                                      "assets/images/bg_blue_container_plane.png"),
                                ),
                              ),
                              child: ListTile(
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(14))),
                                title: const Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: Text(
                                    Strings.share_to_friends,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: ColorApp.white_font),
                                  ),
                                ),
                                subtitle: Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: Text(
                                    Strings.invite_your_friends,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: ColorApp.grey_card_font
                                            .withOpacity(0.6)),
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

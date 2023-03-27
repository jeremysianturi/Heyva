import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heyva/app/modules/breast_feeding/widget/video_item.dart';
import 'package:heyva/app/modules/breast_feeding/widget/video_player_view.dart';
import 'package:heyva/app/routes/app_pages.dart';
import 'package:heyva/app/widgets/reusable_header.dart';
import 'package:heyva/app/widgets/reusable_orange_button_with_trailing_icon.dart';
import 'package:heyva/constant/colors.dart';
import 'package:heyva/constant/strings.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../controllers/breast_feeding_controller.dart';

class BreastFeedingView extends GetView<BreastFeedingController> {
  const BreastFeedingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => LoadingOverlay(
        isLoading: controller.isLoading.value,
        color: Colors.grey,
        opacity: 0.3,
        child: Scaffold(
          body: SingleChildScrollView(
            child: SafeArea(
              child: Stack(
                children: [
                  AspectRatio(
                    aspectRatio: 375 / 390,
                    child: Container(
                      width: Get.width,
                      alignment: Alignment.topCenter,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(controller.bannerImg),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                          margin: const EdgeInsets.only(top: 8),
                          child: const Header(
                              showCenterTitle: true,
                              centerTitle: Strings.excercise,
                              rightText: Strings.login,
                              showIcon: true)),
                      Padding(
                        padding: const EdgeInsets.only(top: 330),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: ColorApp.white,
                                ),
                                color: ColorApp.white,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Wrap(
                                          spacing: 8,
                                          children: controller.tagsList
                                              .map(
                                                (e) => _buildChip(
                                                    e.tag?.name ?? "",
                                                    ColorApp.btn_pink),
                                              )
                                              .toList(),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      controller.title,
                                      style: const TextStyle(
                                        color: ColorApp.black_font_underline,
                                        fontSize: 24,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "by ${controller.creator}",
                                      style: TextStyle(
                                        color: ColorApp.black.withOpacity(0.3),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      controller.body,
                                      style: TextStyle(
                                        color: ColorApp.black.withOpacity(0.3),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              color: ColorApp.white,
                              padding: EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Text(
                                        "How to do",
                                        style: TextStyle(
                                          color: ColorApp.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        "Play all",
                                        style: TextStyle(
                                          color: ColorApp.black,
                                          fontSize: 14,
                                          decoration: TextDecoration.underline,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: List.generate(
                                        controller.attachmentsList.length,
                                        (index) => VideoItem(
                                              index: index,
                                              data: controller
                                                  .attachmentsList[index],
                                            )),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 30),
                                    width: Get.width,
                                    child: OrangeButtonWTrailingIcon(
                                      padding: 0,
                                      determineAction: "from_onplanning_one",
                                      text: Strings.playAll,
                                      ontap: () {
                                        Get.to(myVidePlayer(
                                          videoUrl:
                                              "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
                                        ));
                                        // Get.to(PlayPage(
                                        //   clips: VideoClip.localClips,
                                        // ));
                                      },
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildChip(String label, Color color) {
  return Chip(
    labelPadding: EdgeInsets.all(2.0),
    label: Text(
      label,
      style: const TextStyle(
        color: Colors.white,
      ),
    ),
    backgroundColor: color,
    elevation: 0,
    shadowColor: Colors.grey[60],
    padding: const EdgeInsets.all(8.0),
  );
}

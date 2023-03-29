import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heyva/app/modules/breast_feeding/widget/video_item.dart';
import 'package:miniplayer/miniplayer.dart';

import '../controllers/breast_feeding_controller.dart';

class VideoList extends StatelessWidget {
  const VideoList({
    super.key,
    required this.controller,
  });

  final BreastFeedingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          controller.attachmentsList.length,
          (index) => VideoItem(
                index: index,
                data: controller.attachmentsList[index],
                ontap: () {
                  if (controller.isShwoingVideo.isTrue &&
                      controller.attachmentsList[index].attachment ==
                          controller.videoUrl) {
                    controller.miniPlayerC?.animateToHeight(
                        state: PanelState.MAX, duration: 300.milliseconds);
                  } else {
                    controller.videoUrl =
                        controller.attachmentsList[index].attachment ?? "";
                    controller.videoTitle.value =
                        controller.attachmentsList[index].attachmentTitle ?? "";

                    controller.initVideo();
                    controller.isShwoingVideo.value = true;
                    controller.customVideoPlayerController.videoPlayerController
                        .play();
                  }
                },
              )),
    );
  }
}

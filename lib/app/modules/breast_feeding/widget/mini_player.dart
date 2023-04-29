import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heyva/app/widgets/reusable_header.dart';
import 'package:heyva/constant/colors.dart';
import 'package:heyva/constant/strings.dart';
import 'package:miniplayer/miniplayer.dart';

import '../controllers/breast_feeding_controller.dart';

class MiniPlayer extends StatelessWidget {
  const MiniPlayer({
    super.key,
    required this.controller,
    required this.title,
  });

  final BreastFeedingController controller;
  final String title;

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 800), () {
      controller.miniPlayerC
          ?.animateToHeight(height: Get.height, duration: 600.milliseconds);
    });
    return Container(
      alignment: Alignment.bottomCenter,
      child: Miniplayer(
        minHeight: 80,
        maxHeight: Get.height,
        controller: controller.miniPlayerC,
        builder: (height, percentage) {
          if (controller.isShwoingVideo.isFalse) {
            return const SizedBox.shrink();
          }
          if (height <= 120) {
            return Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 175,
                        height: 80,
                        alignment: Alignment.center,
                        child: CustomVideoPlayer(
                          customVideoPlayerController:
                              controller.customVideoPlayerController,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Flexible(
                                child: Text(
                                  title,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          controller.isShwoingVideo.value = false;
                          controller.videoPlayerController.dispose();
                          controller.update();
                          // setState(() {});
                        },
                      ),
                    ],
                  ),
                ],
              ),
            );
          } else {
            return MiniPlayerFull(controller: controller, title: title);
          }
        },
      ),
    );
  }
}

class MiniPlayerFull extends StatelessWidget {
  const MiniPlayerFull({
    super.key,
    required this.controller,
    required this.title,
  });

  final BreastFeedingController controller;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.black.withOpacity(0.8),
      body: Stack(
        children: [
          Center(
            child: CustomVideoPlayer(
              customVideoPlayerController:
                  controller.customVideoPlayerController,
            ),
          ),
          Container(
              margin: const EdgeInsets.only(top: 50),
              child: Header(
                titleColor: ColorApp.txt_white,
                showCenterTitle: true,
                centerTitle: title,
                rightText: Strings.login,
                showIcon: true,
                isCostomBackFucntion: true,
                onBack: () {
                  controller.miniPlayerC?.animateToHeight(
                      state: PanelState.MIN, duration: 300.milliseconds);
                },
              )),
        ],
      ),
    );
  }
}

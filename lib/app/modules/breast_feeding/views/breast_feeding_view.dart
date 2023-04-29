import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heyva/app/modules/breast_feeding/widget/main_body.dart';
import 'package:heyva/app/modules/breast_feeding/widget/mini_player.dart';
import 'package:heyva/constant/colors.dart';
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
        progressIndicator: const CircularProgressIndicator(color: ColorApp.btn_orange,),
        opacity: 0.3,
        child: Scaffold(
          body: Stack(
            children: [
              MainBody(
                controller: controller,
              ),
              if (controller.isShwoingVideo.isTrue)
                MiniPlayer(
                    controller: controller, title: controller.videoTitle.value)
            ],
          ),
        ),
      ),
    );
  }
}


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

// class MiniPlayer extends StatelessWidget {
//   const MiniPlayer({
//     super.key,
//     required this.controller,
//     required this.title,
//   });
//
//   final BreastFeedingController controller;
//   final String title;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       alignment: Alignment.bottomCenter,
//       child: Miniplayer(
//         minHeight: 80,
//         maxHeight: Get.height,
//         controller: controller.miniPlayerC,
//         builder: (height, percentage) {
//           if (controller.isShwoingVideo.isFalse) {
//             return const SizedBox.shrink();
//           }
//           if (height <= 120) {
//             return Container(
//               color: Theme.of(context).scaffoldBackgroundColor,
//               child: Column(
//                 children: [
//                   Row(
//                     children: [
//                       Container(
//                         child: CustomVideoPlayer(
//                           customVideoPlayerController:
//                               controller.customVideoPlayerController,
//                         ),
//                         width: 175,
//                         height: 70,
//                       ),
//                       Expanded(
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               Flexible(
//                                 child: Text(
//                                   title,
//                                   overflow: TextOverflow.ellipsis,
//                                 ),
//                               ),
//                               // Flexible(
//                               //   child: Text(
//                               //     "selectedVideo.author.username",
//                               //     overflow: TextOverflow.ellipsis,
//                               //     style: Theme.of(context)
//                               //         .textTheme
//                               //         .caption!
//                               //         .copyWith(fontWeight: FontWeight.w500),
//                               //   ),
//                               // ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       IconButton(
//                         icon: const Icon(Icons.close),
//                         onPressed: () {
//                           controller.isShwoingVideo.value = false;
//                           controller.videoPlayerController.dispose();
//                           controller.update();
//                           // setState(() {});
//                         },
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             );
//           } else {
//             return Scaffold(
//               backgroundColor: ColorApp.black.withOpacity(0.8),
//               body: Stack(
//                 children: [
//                   Center(
//                     child: CustomVideoPlayer(
//                       customVideoPlayerController:
//                           controller.customVideoPlayerController,
//                     ),
//                   ),
//                   Container(
//                       margin: const EdgeInsets.only(top: 32),
//                       child: Header(
//                         titleColor: ColorApp.txt_white,
//                         showCenterTitle: true,
//                         centerTitle: title,
//                         rightText: Strings.login,
//                         showIcon: true,
//                         isCostomBackFucntion: true,
//                         onBack: () {
//                           controller.miniPlayerC?.animateToHeight(
//                               state: PanelState.MIN,
//                               duration: 300.milliseconds);
//                         },
//                       )),
//                 ],
//               ),
//             );
//           }
//         },
//       ),
//     );
//   }
// }

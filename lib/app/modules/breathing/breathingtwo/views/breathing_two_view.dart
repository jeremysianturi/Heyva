import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:heyva/app/modules/breathing/breathingtimer/views/breathing_timer_view.dart';
import 'package:heyva/app/widgets/reusable_breathing_header.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/widgets/story_view.dart';
import '../../../../../constant/colors.dart';
import '../../../../../constant/strings.dart';
import '../controllers/breathing_two_controller.dart';

class BreathingTwoView extends StatefulWidget {
  const BreathingTwoView({Key? key}) : super(key: key);

  @override
  _BreathingTwoViewState createState() => _BreathingTwoViewState();
}

class _BreathingTwoViewState extends State<BreathingTwoView> {
  final storyController = StoryController();

  @override
  void dispose() {
    storyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoryView(
        storyItems: [
          StoryItem.text(
            title: Strings.blue_sky,
            backgroundColor: ColorApp.btn_pink,
            textStyle: const TextStyle(
              color: ColorApp.txt_white,
              fontSize: 20,
              fontWeight: FontWeight.w700
            ),
          ),
          StoryItem.text(
            title: Strings.clouds,
            backgroundColor: ColorApp.btn_pink,
            textStyle: const TextStyle(
                color: ColorApp.txt_white,
                fontSize: 20,
                fontWeight: FontWeight.w700
            ),
          ),
          StoryItem.text(
            title: Strings.breath,
            backgroundColor: ColorApp.btn_pink,
            textStyle: const TextStyle(
                color: ColorApp.txt_white,
                fontSize: 20,
                fontWeight: FontWeight.w700
            ),
          ),
        ],
        onStoryShow: (s) {
        },
        onComplete: () {
          Get.to(const BreathingTimerView());
        },
        progressPosition: ProgressPosition.top,
        repeat: false,
        controller: storyController,
      ),
    );
  }
}

// class BreathingTwoView extends GetView<BreathingTwoController> {
//   const BreathingTwoView({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final StoryController controller = StoryController();
//     return Scaffold(
//       body: Container(
//         height: double.maxFinite,
//         color: ColorApp.btn_pink,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: const [
//             BreathingHeader(
//                 indicatorColor1: ColorApp.text_input_bg,
//                 indicatorColor2: ColorApp.broken_white,
//                 indicatorColor3: ColorApp.broken_white,
//                 indicatorColor4: ColorApp.broken_white,
//                 indicatorColor5: ColorApp.broken_white),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_lyric/lyrics_reader.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heyva/app/modules/breathing_exercise/breathing_feelings/views/breathing_feelings_view.dart';
import 'package:heyva/app/modules/breathing_exercise/model/breathing_model.dart'
    as model;
import 'package:heyva/app/routes/app_pages.dart';
import 'package:heyva/constant/colors.dart';
import 'package:heyva/constant/keys.dart';
import 'package:heyva/constant/strings.dart';

import '../controllers/breathing_ex_1_controller.dart';

class BreathingEx1View extends GetView<BreathingEx1Controller> {
  const BreathingEx1View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => WillPopScope(
          onWillPop: () async {
            controller.dispose();
            Get.back();
            return false;
          },
          child: Scaffold(
            body: Stack(
              children: [
                if (controller.pagePosition.value == 0)
                  VoiceOver(
                    controller: controller,
                  ),
                if (controller.pagePosition.value == 1)
                  ImportantNotes(
                    controller: controller,
                  ),
                if (controller.pagePosition.value == 2)
                  MultipleChoice(controller: controller),
                Container(
                  margin: const EdgeInsets.only(
                    top: 60,
                    left: 20,
                    right: 20,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Obx(() {
                          return GridView.count(
                            crossAxisCount: controller.progresList.length,
                            crossAxisSpacing: 2.5,
                            childAspectRatio: 82 / 2,
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            children: List.generate(
                                controller.progresList.length, (index) {
                              return SizedBox(
                                width: Get.width,
                                height: 2,
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  child: LinearProgressIndicator(
                                    value: controller.progresList[index],
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        ColorApp.blue_container),
                                    backgroundColor: ColorApp.grey_font,
                                  ),
                                ),
                              );
                            }),
                          );
                          // return Stack(
                          //   children: [
                          //     Row(
                          //       children: [
                          //         Expanded(
                          //           child: Container(
                          //             width: Get.width,
                          //             height: 2,
                          //             child: ClipRRect(
                          //               borderRadius: BorderRadius.all(
                          //                   Radius.circular(10)),
                          //               child: LinearProgressIndicator(
                          //                 value: controller.progresList[0],
                          //                 valueColor:
                          //                     AlwaysStoppedAnimation<Color>(
                          //                         ColorApp.blue_container),
                          //                 backgroundColor: ColorApp.grey_font,
                          //               ),
                          //             ),
                          //           ),
                          //         ),
                          //         SizedBox(width: 2.5,),
                          //         Expanded(
                          //           child: Container(
                          //             width: Get.width,
                          //             height: 2,
                          //             child: ClipRRect(
                          //               borderRadius: BorderRadius.all(
                          //                   Radius.circular(10)),
                          //               child: LinearProgressIndicator(
                          //                 value: controller.progresList[1],
                          //                 valueColor:
                          //                     AlwaysStoppedAnimation<Color>(
                          //                         ColorApp.blue_container),
                          //                 backgroundColor: ColorApp.grey_font,
                          //               ),
                          //             ),
                          //           ),
                          //         ),
                          //         SizedBox(width: 2.5,),
                          //         Expanded(
                          //           child: Container(
                          //             width: Get.width,
                          //             height: 2,
                          //             child: ClipRRect(
                          //               borderRadius: BorderRadius.all(
                          //                   Radius.circular(10)),
                          //               child: LinearProgressIndicator(
                          //                 value: controller.progresList[2],
                          //                 valueColor:
                          //                 AlwaysStoppedAnimation<Color>(
                          //                     ColorApp.blue_container),
                          //                 backgroundColor: ColorApp.grey_font,
                          //               ),
                          //             ),
                          //           ),
                          //         )
                          //       ],
                          //     ),
                          //   ],
                          // );
                        }),
                      ),
                      SizedBox(
                        height: 2,
                        width: 2.5,
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 2,
                          width: Get.width,
                          decoration: BoxDecoration(
                              color: controller.pagePosition.value > 0
                                  ? ColorApp.blue_container
                                  : ColorApp.grey_font,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10))),
                        ),
                      ),
                      // Expanded(
                      //   child: Container(
                      //     height: 2,
                      //     width: Get.width,
                      //     decoration: BoxDecoration(
                      //         color: controller.pagePosition.value >= 1
                      //             ? ColorApp.black
                      //             : ColorApp.black.withOpacity(0.3),
                      //         borderRadius:
                      //             const BorderRadius.all(Radius.circular(10))),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class MultipleChoice extends StatelessWidget {
  const MultipleChoice({
    super.key,
    required this.controller,
  });

  final BreathingEx1Controller controller;

  @override
  Widget build(BuildContext context) {
    var box = GetStorage();
    var data = box.read(Keys.breathing1Storage) as model.Child;

    return Container(
      height: Get.height,
      width: Get.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg_breating_exercise.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 80,
          ),
          Row(
            children: [
              const Expanded(child: SizedBox()),
              const Text(
                Strings.breathing_exercise,
                style: TextStyle(
                    decoration: TextDecoration.none,
                    color: ColorApp.black_article_title,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              Expanded(
                child: Text(
                  Strings.skip,
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      color: ColorApp.black.withOpacity(0.3),
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.end,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 63,
                ),
                Text(
                  data.programDetail?[3].textContent ?? "",
                  style: const TextStyle(
                      decoration: TextDecoration.none,
                      color: ColorApp.blue_container,
                      fontSize: 24,
                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 100,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: controller.multipleChoice.length,
                  itemBuilder: (BuildContext context, int index) =>
                      BreatingFeelingsItems(
                    title: controller.multipleChoice[index],
                    index: index,
                    ontap: () {
                      Get.toNamed(Routes.BREATHING_FINISH);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ImportantNotes extends StatelessWidget {
  const ImportantNotes({
    super.key,
    required this.controller,
  });

  final BreathingEx1Controller controller;

  @override
  Widget build(BuildContext context) {
    var box = GetStorage();

    var data = box.read(Keys.breathing1Storage) as model.Child;
    // var text = box.read(Keys.breathing2Storage);
    return Container(
      height: Get.height,
      width: Get.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg_breating_exercise.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: InkWell(
        onTap: () {
          // Get.toNamed(Routes.BREATHING_FEELINGS);
          controller.pagePosition + 1;
        },
        child: Stack(
          children: [
            SizedBox(
              width: Get.width,
              height: Get.height,
              child: Stack(
                children: [
                  Positioned(
                    left: 20,
                    top: 200,
                    child:
                        SvgPicture.asset("assets/icons/ic_yellow_flower.svg"),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 140,
                    child: SvgPicture.asset("assets/icons/ic_red_flower.svg"),
                  )
                ],
              ),
            ),
            Column(
              children: [
                const SizedBox(
                  height: 80,
                ),
                Row(
                  children: [
                    const Expanded(child: SizedBox()),
                    const Text(
                      Strings.breathing_exercise,
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          color: ColorApp.black_article_title,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Get.toNamed(Routes.BREATHING_FEELINGS);
                        },
                        child: Text(
                          Strings.skip,
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              color: ColorApp.black.withOpacity(0.3),
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Important notes",
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              color: ColorApp.black.withOpacity(0.3),
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          data.programDetail?[2].textContent ?? "",
                          style: const TextStyle(
                              decoration: TextDecoration.none,
                              color: ColorApp.black_view_all,
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ),
                const Text(
                  Strings.tapToFinish,
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      color: ColorApp.black_article_title,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class VoiceOver extends StatelessWidget {
  const VoiceOver({
    super.key,
    required this.controller,
  });

  final BreathingEx1Controller controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.ontapVoice();
      },
      child: Container(
        height: Get.height,
        width: Get.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg_breating_exercise.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Container(
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              const Text(
                Strings.breathing_exercise,
                style: TextStyle(
                    decoration: TextDecoration.none,
                    color: ColorApp.black_article_title,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 88, left: 58, right: 58),
                  child: Image.asset("assets/images/bg_voice_over.png")),
              const SizedBox(
                height: 22,
              ),
              Obx(
                () => Container(
                  height: 200,
                  // color: Colors.grey,
                  margin: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: LyricsReader(
                    onTap: () {
                      controller.ontapVoice();
                    },
                    model: controller.lyricModel,
                    position: controller.playProgress.value,
                    lyricUi: controller.lyricUI,
                    playing: controller.playing.value,
                    size: Size(double.infinity,
                        MediaQuery.of(context).size.height / 2),
                    emptyBuilder: () => Center(
                      child: Text(
                        "No lyrics",
                        style: controller.lyricUI.getOtherMainTextStyle(),
                      ),
                    ),
                  ),
                ),
              ),
              const Expanded(child: SizedBox()),
              Obx(
                () => controller.showButton.isTrue
                    ? const Text(
                        Strings.tapToFinish,
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            color: ColorApp.black_article_title,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      )
                    : SizedBox(),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

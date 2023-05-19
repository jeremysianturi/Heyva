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

import '../controllers/breathing_ex_3_controller.dart';

class BreathingEx3View extends GetView<BreathingEx3Controller> {
  const BreathingEx3View({Key? key}) : super(key: key);

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
                  MultipleChoice(
                      controller: controller, multipleChoiceIndex: 2),
                if (controller.pagePosition.value == 2)
                  ImportantNotes(
                    controller: controller,
                  ),
                if (controller.pagePosition.value == 3)
                  MultipleChoice(
                      controller: controller, multipleChoiceIndex: 4),
                Container(
                  margin: const EdgeInsets.only(
                    top: 60,
                    left: 20,
                    right: 20,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Obx(() {
                          return GridView.count(
                            crossAxisCount: controller.progresList.length,
                            crossAxisSpacing: 2.5,
                            childAspectRatio: 40 / 2,
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            children: List.generate(
                                controller.progresList.length, (index) {
                              return SizedBox(
                                width: Get.width,
                                height: 2,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  child: LinearProgressIndicator(
                                    value: controller.progresList[index],
                                    valueColor:
                                        const AlwaysStoppedAnimation<Color>(
                                            ColorApp.blue_container),
                                    backgroundColor: ColorApp.grey_font,
                                  ),
                                ),
                              );
                            }),
                          );
                        }),
                      ),
                      const SizedBox(
                        height: 2,
                        width: 2.5,
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 2,
                          width: Get.width,
                          decoration: BoxDecoration(
                              color: controller.pagePosition.value > 1
                                  ? ColorApp.blue_container
                                  : ColorApp.grey_font,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10))),
                        ),
                      ),
                      const SizedBox(
                        height: 2,
                        width: 2.5,
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 2,
                          width: Get.width,
                          decoration: BoxDecoration(
                              color: controller.pagePosition.value > 2
                                  ? ColorApp.blue_container
                                  : ColorApp.grey_font,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10))),
                        ),
                      ),
                      const SizedBox(
                        height: 2,
                        width: 2.5,
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 2,
                          width: Get.width,
                          decoration: BoxDecoration(
                              color: controller.pagePosition.value > 3
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
    required this.multipleChoiceIndex,
  });

  final BreathingEx3Controller controller;

  /// 2/4
  final int multipleChoiceIndex;

  @override
  Widget build(BuildContext context) {
    var box = GetStorage();
    var data = box.read(Keys.breathing3Storage) as model.Child;

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
                  data.programDetail?[multipleChoiceIndex].textContent ?? "",
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
                  itemCount: data
                      .programDetail?[multipleChoiceIndex].jsonContent.length,
                  itemBuilder: (BuildContext context, int index) =>
                      BreatingFeelingsItems(
                    title: data
                        .programDetail?[multipleChoiceIndex].jsonContent[index],
                    index: index,
                    ontap: () {
                      if (multipleChoiceIndex == 2) {
                        controller.pagePosition.value =
                            controller.pagePosition.value + 1;
                      } else {
                        Get.toNamed(Routes.BREATHING_FINISH);
                      }
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

  final BreathingEx3Controller controller;

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
                          controller.pagePosition + 1;
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
                          data.programDetail?[3].textContent ?? "",
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

  final BreathingEx3Controller controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (controller.showButton.isTrue) {
          if (controller.timerIndex == controller.progresList.length - 1) {
            // FocusScope.of(context).requestFocus(new FocusNode());
            // if (controller.audioPlayer != null) {
            controller.audioPlayer?.pause();
            // }
            Future.delayed(200.milliseconds, () {
              controller.pagePosition.value = 1;
            });
          } else {
            controller.showButton.value = false;
            controller.stop = 9999;
            controller.startTimerIndex(controller.timerIndex,
                controller.mainPeriode - controller.tick);
          }
        }
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
                () => GestureDetector(
                  onTap: () {
                    if (controller.showButton.isTrue) {
                      if (controller.timerIndex ==
                          controller.progresList.length - 1) {
                        // FocusScope.of(context).requestFocus(new FocusNode());
                        // if (controller.audioPlayer != null) {
                        controller.audioPlayer?.pause();
                        // }
                        Future.delayed(200.milliseconds, () {
                          controller.pagePosition.value = 1;
                        });
                      } else {
                        controller.showButton.value = false;
                        controller.stop = 9999;
                        controller.startTimerIndex(controller.timerIndex,
                            controller.mainPeriode - controller.tick);
                      }
                    }
                  },
                  child: Container(
                    height: 200,
                    // color: Colors.grey,
                    margin: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: LyricsReader(
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
              ),
              // InkWell(
              //     onTap: () {
              //       controller.onPlay();
              //     },
              //     child: Container(
              //       margin: const EdgeInsets.only(top: 40),
              //       padding: const EdgeInsets.only(
              //           left: 30, right: 30, top: 12, bottom: 6),
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(15),
              //         color: Colors.white,
              //         boxShadow: [
              //           BoxShadow(
              //             color: Colors.grey.withOpacity(0.2),
              //             spreadRadius: 2,
              //             blurRadius: 2,
              //             offset:
              //                 const Offset(0, 2), // changes position of shadow
              //           ),
              //         ],
              //       ),
              //       child: Obx(
              //         () => Text(
              //           controller.prettyDuration(Duration(
              //               milliseconds: controller.playProgress.value)),
              //           style: const TextStyle(
              //               fontWeight: FontWeight.w500,
              //               fontSize: 18,
              //               color: ColorApp.gery_voice_over),
              //         ),
              //       ),
              //     )),
              // InkWell(
              //     onTap: () {
              //       if (controller.audioPlayer != null) {
              //         controller.audioPlayer?.pause();
              //       }
              //     },
              //     child: Container(
              //       margin: const EdgeInsets.only(top: 10),
              //       padding: const EdgeInsets.only(
              //           left: 30, right: 30, top: 12, bottom: 6),
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(15),
              //         color: Colors.white,
              //         boxShadow: [
              //           BoxShadow(
              //             color: Colors.grey.withOpacity(0.2),
              //             spreadRadius: 2,
              //             blurRadius: 2,
              //             offset:
              //                 const Offset(0, 2), // changes position of shadow
              //           ),
              //         ],
              //       ),
              //       child: const Text(
              //         "Pause",
              //         style: TextStyle(
              //             fontWeight: FontWeight.w500,
              //             fontSize: 18,
              //             color: ColorApp.gery_voice_over),
              //       ),
              //     )),
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

                    // OrangeButtonWTrailingIcon(
                    //         determineAction: "ontap",
                    //         text: Strings.next,
                    //         ontap: () {
                    //           // FocusScope.of(context).requestFocus(new FocusNode());
                    //           // if (controller.audioPlayer != null) {
                    //           controller.audioPlayer?.pause();
                    //           // }
                    //           Future.delayed(200.milliseconds, () {
                    //             controller.pagePosition.value = 1;
                    //           });
                    //         },
                    //       )
                    : const SizedBox(),
              ),

              const SizedBox(
                height: 20,
              ),

              // InkWell(
              //     onTap: () {
              //       if (controller.audioPlayer != null) {
              //         controller.audioPlayer?.pause();
              //       }
              //       Future.delayed(20.milliseconds, () {
              //         controller.pagePosition.value = 1;
              //       });
              //     },
              //     child: Container(
              //       margin: const EdgeInsets.only(top: 10),
              //       padding: const EdgeInsets.only(
              //           left: 30, right: 30, top: 12, bottom: 6),
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(15),
              //         color: Colors.white,
              //         boxShadow: [
              //           BoxShadow(
              //             color: Colors.grey.withOpacity(0.2),
              //             spreadRadius: 2,
              //             blurRadius: 2,
              //             offset:
              //                 const Offset(0, 2), // changes position of shadow
              //           ),
              //         ],
              //       ),
              //       child: const Text(
              //         "Next",
              //         style: TextStyle(
              //             fontWeight: FontWeight.w500,
              //             fontSize: 18,
              //             color: ColorApp.gery_voice_over),
              //       ),
              //     )),
            ],
          ),
        ),
      ),
    );
  }
}

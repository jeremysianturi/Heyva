import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lyric/lyrics_reader.dart';

import 'package:get/get.dart';
import 'package:heyva/app/routes/app_pages.dart';
import 'package:heyva/app/widgets/reusable_header.dart';
import 'package:heyva/constant/colors.dart';
import 'package:heyva/constant/strings.dart';

import '../../views/const.dart';
import '../controllers/breathin_voice_controller.dart';

class BreathinVoiceView extends GetView<BreathinVoiceController> {
  const BreathinVoiceView({Key? key}) : super(key: key);

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
                if (controller.pagePosition.value == 1) ImportantNotes(),
                Container(
                  margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 2,
                          width: Get.width,
                          decoration: BoxDecoration(
                              color: controller.pagePosition.value >= 0
                                  ? ColorApp.black
                                  : ColorApp.black.withOpacity(0.3),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                        ),
                      ),
                      const SizedBox(
                        width: 2.5,
                      ),
                      Expanded(
                        child: Container(
                          height: 2,
                          width: Get.width,
                          decoration: BoxDecoration(
                              color: controller.pagePosition.value >= 1
                                  ? ColorApp.black
                                  : ColorApp.black.withOpacity(0.3),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class ImportantNotes extends StatelessWidget {
  const ImportantNotes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
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
            Get.toNamed(Routes.BREATHING_FEELINGS);
          },
          child: Column(
            children: [
              const SizedBox(
                height: 17,
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
                      const Text(
                        "This breathing program can be done for as little as five minutes or as long as you like. The key is to make it a regular practice, incorporating it into your daily routine whenever possible to help promote relaxation, and emotional well-being.",
                        style: TextStyle(
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

  final BreathinVoiceController controller;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: Get.height,
        width: Get.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg_heyva.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Container(
          child: Column(
            children: [
              const SizedBox(
                height: 17,
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
              SizedBox(
                height: 22,
              ),
              Obx(
                () => Container(
                  height: 200,
                  // color: Colors.grey,
                  margin: EdgeInsets.symmetric(horizontal: 40.0),
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
              InkWell(
                  onTap: () {
                    controller.onPlay();
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 40),
                    padding: const EdgeInsets.only(
                        left: 30, right: 30, top: 12, bottom: 6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: Offset(0, 2), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Obx(
                      () => Text(
                        controller.prettyDuration(Duration(
                            milliseconds: controller.playProgress.value)),
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: ColorApp.gery_voice_over),
                      ),
                    ),
                  )),
              InkWell(
                  onTap: () {
                    if (controller.audioPlayer != null) {
                      controller.audioPlayer?.pause();
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 10),
                    padding: const EdgeInsets.only(
                        left: 30, right: 30, top: 12, bottom: 6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset:
                              const Offset(0, 2), // changes position of shadow
                        ),
                      ],
                    ),
                    child: const Text(
                      "Pause",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: ColorApp.gery_voice_over),
                    ),
                  )),
              InkWell(
                  onTap: () {
                    controller.pagePosition.value = 1;
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 10),
                    padding: const EdgeInsets.only(
                        left: 30, right: 30, top: 12, bottom: 6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset:
                              const Offset(0, 2), // changes position of shadow
                        ),
                      ],
                    ),
                    child: const Text(
                      "Next",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: ColorApp.gery_voice_over),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

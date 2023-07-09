import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heyva/app/modules/pelvic/breathingfinish/views/breathing_finish_view.dart';

class BreathingTimerController extends GetxController {
  var progressValue = 0.0.obs;
  AudioPlayer? audioPlayer;
  var playing = false.obs;
  var sliderProgress = 0.0.obs;
  var playProgress = 0.obs;
  var max_value = 10.0.obs;
  var isTap = false.obs;
  double _start = 0.0;

  @override
  void onInit() {
    // startTimer();
    onPlay();
    super.onInit();
  }

  onPlay() {
    if (audioPlayer == null) {
      audioPlayer = AudioPlayer()..play(AssetSource('pelvic_floor.wav'));
      playing.value = true;
      //
      audioPlayer?.onDurationChanged.listen((Duration event) {
        // max_value.value = event.inMilliseconds.toDouble();
        _start = event.inSeconds.toDouble();
      });
      List<int> prevPositions = [0, 0];
      int lostPositions = 0;
      audioPlayer?.onPositionChanged.listen((Duration event) {
        if (isTap.isTrue) return;

        int positionChanged = event.inMilliseconds;
        if (prevPositions[1] > positionChanged) {
          int diff = prevPositions[1] - prevPositions[0];
          int tempNext = prevPositions[1] + diff;
          lostPositions += tempNext - positionChanged;
        }
        int correctPosition = positionChanged + lostPositions;
        // sliderProgress.value = correctPosition.toDouble();
        progressValue.value = (correctPosition / 1000) / _start;
        debugPrint("correct position ${(correctPosition.toDouble()) / _start}");
        if (progressValue.value == 1) {
          Future.delayed(2.seconds, () {
            Get.to(const BreathingFinishView());
          });
        }
        prevPositions.add(positionChanged);
        prevPositions.removeAt(0);
      });

      audioPlayer?.onPlayerStateChanged.listen((PlayerState state) {
        playing.value = state == PlayerState.playing;
      });
    } else {
      audioPlayer?.resume();
    }
  }

  @override
  void dispose() {
    playing.value = false;
    audioPlayer?.dispose();
    // timer.cancel();

    super.dispose();
  }

  late Timer timer;

  // final int _start = 16000;

  void startTimer() {
    const oneSec = Duration(milliseconds: 1);
    var _tick = 0;

    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == _tick) {
          Future.delayed(1.seconds, () {
            Get.to(const BreathingFinishView());
          });
          timer.cancel();
        } else {
          progressValue.value = timer.tick / 16000;
          _tick++;
        }
      },
    );
  }

  @override
  void onClose() {
    timer.cancel();
    super.onClose();
  }
}

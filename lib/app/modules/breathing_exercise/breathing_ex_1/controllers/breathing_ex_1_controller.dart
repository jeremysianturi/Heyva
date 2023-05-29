import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lyric/lyrics_reader.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heyva/app/modules/breathing_exercise/model/breathing_model.dart'
    as model;
import 'package:heyva/app/modules/breathing_exercise/views/const.dart';
import 'package:heyva/constant/keys.dart';

class BreathingEx1Controller extends GetxController {
  var pagePosition = 0.obs;

  AudioPlayer? audioPlayer;
  var sliderProgress = 0.0.obs;
  var playProgress = 0.obs;
  var max_value = 10.0.obs;
  var isTap = false.obs;
  var playing = false.obs;
  bool useEnhancedLrc = false;
  var lyricModel =
      LyricsModelBuilder.create().bindLyricToMain(breathingEx1Lyric).getModel();

  var lyricUI = UINetease();
  double _start = 0.0;

  var progresList = [
    0.0,
    0.0,
    0.0,
  ].obs;

  var box = GetStorage();

  List get multipleChoice {
    var data = box.read(Keys.breathing1Storage) as model.Child;
    return data.programDetail?[3].jsonContent;
  }

  onPlay() {
    if (audioPlayer == null) {
      audioPlayer = AudioPlayer()..play(AssetSource('breathing_ex_1.mp3'));
      playing.value = true;

      audioPlayer?.onDurationChanged.listen((Duration event) {
        max_value.value = event.inMilliseconds.toDouble();
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
        sliderProgress.value = correctPosition.toDouble();
        playProgress.value = correctPosition;
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
    timer.cancel();

    super.dispose();
  }

  var progressValue = 0.0.obs;
  var progressValue2 = 0.0.obs;

  var timerIndex = 0;
  var tick = 0;
  var mainPeriode = 0.0;
  var stop = 2;

  @override
  void onInit() {
    onPlay();
    Future.delayed(700.milliseconds, () {
      // _start = 3;
      mainPeriode = _start / progresList.length;
      startTimerIndex(timerIndex, mainPeriode-1);
    });

    super.onInit();
  }

  startTimerIndex(index, periode) {
    debugPrint("periode $periode");

    startTimer(
        periode: periode,
        onDone: () {
          if (index == progresList.length - 1) {
            /// tampil button ketika sudah selesai
            showButton.value = true;
          }
          if (timerIndex != progresList.length - 1) {
            timerIndex = timerIndex + 1;
            startTimerIndex(timerIndex, mainPeriode-1);
          }
        },
        onTick: (val) {
          tick = val;
          debugPrint("tick $val");

          /// fungsi pause
          // if (index == 1 && val == stop) {
          //   timer.cancel();
          //   showButton.value = true;
          // }

          progresList[index] = val / periode;
          progresList.refresh();
        });
  }

  late Timer timer;
  var showButton = false.obs;

  void startTimer(
      {required Function onDone, required Function onTick, required periode}) {
    int _tick = 0;
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (periode <= _tick) {
          onDone();
          timer.cancel();
        } else {
          onTick(timer.tick);
          _tick++;
        }
      },
    );
  }

  double normalize(double value, double min, double max) {
    return ((value - min) / (max - min)).clamp(0, 1);
  }
  
  ontapVoice(){
    if (showButton.isTrue) {
      if (timerIndex == progresList.length - 1) {
        // FocusScope.of(context).requestFocus(new FocusNode());
        // if (audioPlayer != null) {
        audioPlayer?.pause();
        // }
        Future.delayed(200.milliseconds, () {
          pagePosition.value = 1;
        });
      } else {
        showButton.value = false;
        stop = 9999;
        startTimerIndex(timerIndex,
            mainPeriode - tick);
      }
    }
  }
}

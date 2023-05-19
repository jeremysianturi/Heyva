import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lyric/lyrics_reader.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heyva/app/modules/breathing_exercise/views/const.dart';
import 'package:heyva/constant/strings.dart';

class BreathingEx2Controller extends GetxController {
  var pagePosition = 0.obs;

  AudioPlayer? audioPlayer;

  var sliderProgress = 0.0.obs;
  var playProgress = 0.obs;
  var max_value = 10.0.obs;
  var isTap = false.obs;
  var playing = false.obs;
  bool useEnhancedLrc = false;
  var lyricModel =
      LyricsModelBuilder.create().bindLyricToMain(breathingEx2Lyric).getModel();

  var lyricUI = UINetease();
  double _start = 0.0;

  var progresList = [
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
  ].obs;

  List<AutoStopModel> autoStopList = [
    AutoStopModel(
        mainStop: 47000, subStop: 47, subPosition: 0, itHasStoped: false),
    AutoStopModel(
        mainStop: 144000, subStop: 52, subPosition: 1, itHasStoped: false),
    AutoStopModel(
        mainStop: 238200, subStop: 52, subPosition: 2, itHasStoped: false),
    AutoStopModel(
        mainStop: 321100, subStop: 46 - 3, subPosition: 3, itHasStoped: false),
    AutoStopModel(
        mainStop: 380210, subStop: 13, subPosition: 4, itHasStoped: false),
    AutoStopModel(
        mainStop: 431100, subStop: 51, subPosition: 4, itHasStoped: false),
  ];

  var box = GetStorage();

  onPlay() {
    if (audioPlayer == null) {
      audioPlayer = AudioPlayer()..play(AssetSource('breathing_ex_2.mp3'));
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

        var stop = autoStopList.firstWhereOrNull((e) => e.itHasStoped == false);

        var mainStop = stop?.mainStop ?? 90000000000000;

        if (mainStop <= correctPosition && stop?.itHasStoped == false) {
          audioPlayer?.pause();
          autoStopList[0].itHasStoped = true;
          timer.cancel();
          showButton.value = true;
          buttonTile.value = Strings.tapToContinue;
          stop?.itHasStoped = true;
        }

        if ((max_value.value - 1000) <= correctPosition) {
          showButton.value = true;
          isDone.value = true;
          buttonTile.value = Strings.tapToContinue;
        }
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
  var isDone = false.obs;
  var buttonTile = Strings.tapToFinish.obs;

  @override
  void onInit() {
    super.onInit();
  }

  playtimer() {
    // _start = 10;
    mainPeriode = _start / progresList.length;
    startTimerIndex(timerIndex, mainPeriode - 1);
  }

  startTimerIndex(index, periode) {
    debugPrint("periode $periode");
    startTimer(
        periode: periode,
        onDone: () {
          if (index == progresList.length - 1) {
            /// tampil button ketika sudah selesai
            showButton.value = true;
            buttonTile.value = Strings.tapToFinish;
          }
          if (timerIndex != progresList.length - 1) {
            timerIndex = timerIndex + 1;
            startTimerIndex(timerIndex, mainPeriode - 1);
          }
        },
        onTick: (val) {
          tick = val;

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

  ontap() {
    if (showButton.isTrue) {
      if (isDone.isTrue) {
        /// kondisi selesai (finish)
        timer.cancel();
        audioPlayer?.stop();
        pagePosition.value = pagePosition.value + 1;
      } else {
        /// kondisi ketika auto stop
        showButton.value = false;
        stop = 9999;
        audioPlayer?.resume();
        startTimerIndex(timerIndex, mainPeriode - tick);
      }
    }
  }
}

class AutoStopModel {
  /// on main player
  final double mainStop;

  /// on sub player
  final int subStop;

  bool itHasStoped;
  final int subPosition;

  AutoStopModel({
    required this.mainStop,
    required this.subStop,
    required this.itHasStoped,
    required this.subPosition,
  });
}

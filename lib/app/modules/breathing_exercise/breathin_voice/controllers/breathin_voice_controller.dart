import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_lyric/lyrics_reader.dart';
import 'package:get/get.dart';
import 'package:heyva/app/modules/breathing_exercise/views/const.dart';

class BreathinVoiceController extends GetxController {
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

  String prettyDuration(Duration duration) {
    var minutes = duration.inMinutes;
    var seconds = (duration.inSeconds - minutes * 60).toString();

    if (minutes.toString().length < 2) {
      minutes = int.parse("0${minutes}");
    }
    if (seconds.length < 2) {
      seconds = "0$seconds";
    }
    return '$minutes : $seconds';
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

  @override
  void onInit() {
    Future.delayed(400.milliseconds, () {
      startTimer();
    });
    super.onInit();
  }

  late Timer timer;
  var showButton = false.obs;

  void startTimer() {
    int _tick = 0 ;
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == _tick) {
          timer.cancel();
          showButton.value = true;
        } else {
          progressValue.value = timer.tick / (_start);
          _tick ++ ;
        }
      },
    );
  }
  double normalize(double value, double min, double max) {
    return ((value - min) / (max - min)).clamp(0, 1);
  }

}

import 'dart:async';

import 'package:get/get.dart';
import 'package:heyva/app/modules/pelvic/breathingfinish/views/breathing_finish_view.dart';

class BreathingTimerController extends GetxController {
  var progressValue = 0.0.obs;

  @override
  void onInit() {
    startTimer();
    super.onInit();
  }

  late Timer timer;
  final int _start = 16000;

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

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
  int _start = 10000;

  void startTimer() {
    const oneSec = Duration(milliseconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          Future.delayed(1.seconds, () {
            Get.to(const BreathingFinishView());
          });
          timer.cancel();
        } else {
          progressValue.value = timer.tick / 10000;
          _start--;
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

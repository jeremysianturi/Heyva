import 'package:get/get.dart';

class TurnOnNotifController extends GetxController {

  RxBool on = false.obs;
  RxBool on2 = false.obs;

  void toggle() => on.value = on.value ? false : true;
  void toggle2() => on2.value = on2.value ? false : true;

  @override
  void onClose() {
    super.onClose();
  }
}
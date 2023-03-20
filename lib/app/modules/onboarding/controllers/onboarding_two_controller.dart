import 'package:get/get.dart';

class OnBoardingTwoController extends GetxController {

  Rx<DateTime> dateChosen = DateTime.now().obs;

  void setDate(DateTime currentDateChosen) {
    dateChosen.value = currentDateChosen;
  }

  @override
  void onClose() {
    super.onClose();
  }
}
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heyva/app/modules/register/model/register_storage_model.dart';
import 'package:heyva/app/routes/app_pages.dart';
import 'package:heyva/constant/keys.dart';

class OnBoardingTwoController extends GetxController {
  Rx<DateTime> dateChosen = DateTime.now().obs;

  void setDate(DateTime currentDateChosen) {
    dateChosen.value = currentDateChosen;
  }

  @override
  void onClose() {
    super.onClose();
  }

  onTap() {
    final box = GetStorage();
    var data = box.read(Keys.registStorage) as RegisterStorageModel;
    box.write(
        Keys.registStorage,
        RegisterStorageModel(
            email: data.email,
            password: data.password,
            fullName: data.fullName,
            birthDate: dateChosen.value.toString(),
            pregnancyStatus: data.pregnancyStatus,
            interests: data.interests));
    800.milliseconds;
    Get.toNamed(Routes.ONBOARDING_THREE);
  }
}

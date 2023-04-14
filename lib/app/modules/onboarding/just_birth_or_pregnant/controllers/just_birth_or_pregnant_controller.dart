import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heyva/app/modules/register/model/register_storage_model.dart';
import 'package:heyva/app/routes/app_pages.dart';
import 'package:heyva/constant/keys.dart';

class JustBirthOrPregnantController extends GetxController {
  Rx<DateTime> dateChosen = DateTime.now().obs;

  void setDate(DateTime currentDateChosen) {
    dateChosen.value = currentDateChosen;
  }

  dynamic argumentData = Get.arguments;

  String get title {
    if (argumentData[Keys.titleArguments].toString().isNotEmpty) {
      return argumentData[Keys.titleArguments].toString();
    }
    return '';
  }

  @override
  void onInit() {
    super.onInit();
  }

  onTap() {
    var eddDate = "";
    var childBirth = "";
    if (argumentData[Keys.titleArguments]
        .toString()
        .toLowerCase()
        .contains("edd")) {
      eddDate = dateChosen.value.toString();
    } else {
      childBirth = dateChosen.value.toString();
    }

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
            interests: data.interests,
            childBirthDate: childBirth,
            estimateDueDate: eddDate));
    800.milliseconds;
    Get.toNamed(Routes.ONPLANNING_ONE);
  }
}

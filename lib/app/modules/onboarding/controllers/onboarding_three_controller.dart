import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heyva/app/modules/onboarding/model/pregnancy_status_model.dart'
    as pregnancyModel;
import 'package:heyva/app/modules/onboarding/provider/onboarding_provider.dart';
import 'package:heyva/app/modules/register/model/register_storage_model.dart';
import 'package:heyva/app/routes/app_pages.dart';
import 'package:heyva/app/widgets/reusable_bottomSheet_message.dart';
import 'package:heyva/constant/keys.dart';
import 'package:heyva/services/dio_services.dart';

class OnBoardingThreeController extends GetxController {
  var isLoading = false.obs;
  late DioClient _client;
  late OnboardingProviders _provider;

  var pregnancyStatusResonse = pregnancyModel.PregnancyStatusModel(
          success: "", data: null, message: "", error: "")
      .obs;

  var statusList = <pregnancyModel.Data>[].obs;

  getPregnancyStatus() async {
    isLoading.value = true;
    try {
      pregnancyStatusResonse.value = (await _provider.getPregnancyStatus())!;
      isLoading.value = false;
      if (pregnancyStatusResonse.value.success == "Success") {
        statusList.clear();
        statusList.addAll(
            pregnancyStatusResonse.value.data as List<pregnancyModel.Data>);
      } else {
        bottomSheetMessage(
            color: "red", desc: pregnancyStatusResonse.value.message ?? "");
      }
    } catch (e) {
      isLoading.value = false;

      debugPrint("error  $e");
    }
  }

  @override
  void onInit() {
    _client = DioClient();
    _provider = OnboardingProviders(_client.init());
    getPregnancyStatus();
    super.onInit();
  }

  onTap({required String pregnancyStatusId}) {
    final box = GetStorage();
    var data = box.read(Keys.registStorage) as RegisterStorageModel;
    debugPrint("data ${data.pregnancyStatus}");

    box.write(
        Keys.registStorage,
        RegisterStorageModel(
            email: data.email,
            password: data.password,
            fullName: data.fullName,
            birthDate: data.birthDate,
            pregnancyStatus: pregnancyStatusId,
            interests: data.interests));

    var data2 = box.read(Keys.registStorage) as RegisterStorageModel;

    debugPrint("data2 ${data2.pregnancyStatus}");
    800.milliseconds;
    Get.toNamed(Routes.ONPLANNING_ONE);
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heyva/app/modules/onboarding/model/interests_tag_model.dart';
import 'package:heyva/app/modules/onboarding/provider/onboarding_provider.dart';
import 'package:heyva/app/modules/register/model/register_model.dart';
import 'package:heyva/app/modules/register/model/register_storage_model.dart';
import 'package:heyva/app/modules/register/provider/register_provider.dart';
import 'package:heyva/app/routes/app_pages.dart';
import 'package:heyva/app/widgets/reusable_bottomSheet_message.dart';
import 'package:heyva/constant/keys.dart';
import 'package:heyva/services/dio_services.dart';

import '../../../../../model/interest.dart';

class OnPlanningOneController extends GetxController {
  RxBool isVisible = true.obs;
  RxInt selectedBtnRemaining = 0.obs;

  void showButton() {
    isVisible.value = true;
  }

  void hideContainer() {
    isVisible.value = false;
  }

  void anyButtonStillSelected(String whatToDo) {
    if (whatToDo == "plus") {
      selectedBtnRemaining += 1;
    } else {
      selectedBtnRemaining -= 1;
    }
  }

  @override
  void onInit() {
    super.onInit();
    _client = DioClient();
    _provider = OnboardingProviders(_client.init());
    _registerProvider = RegisterProvider(_client.init());
    getInterest();
    // List.generate(8, (index) => list.add(Interest(subject: 'No',isSelected: false.obs),),);
  }

  var isLoading = false.obs;
  late DioClient _client;
  late OnboardingProviders _provider;
  late RegisterProvider _registerProvider;

  var interestResponse =
      InterestsTagModel(success: "", data: null, message: "", error: "").obs;

  var list = <Interest>[].obs;

  getInterest() async {
    isLoading.value = true;
    try {
      interestResponse.value = (await _provider.getInterestsTags())!;
      isLoading.value = false;
      if (interestResponse.value.success == "Success") {
        list.clear();
        interestResponse.value.data?.forEach((e) {
          list.add(Interest(
              id: e.id ?? "", subject: e.name ?? "", isSelected: false.obs));
        });
      } else {
        bottomSheetMessage(
            color: "red", desc: interestResponse.value.message ?? "");
      }
    } catch (e) {
      isLoading.value = false;
      debugPrint("error  $e");
    }
  }

  onTap() {
    List<String> interestsList = [];

    list.forEach((e) {
      if (e.isSelected.isTrue) {
        interestsList.add(e.id);
      }
    });

    final box = GetStorage();
    var data = box.read(Keys.registStorage) as RegisterStorageModel;
    debugPrint("data ${data.interests}");

    box.write(
        Keys.registStorage,
        RegisterStorageModel(
            email: data.email,
            password: data.password,
            fullName: data.fullName,
            birthDate: data.birthDate,
            pregnancyStatus: data.pregnancyStatus,
            interests: interestsList));

    var data2 = box.read(Keys.registStorage) as RegisterStorageModel;

    200.milliseconds;
    // Get.toNamed(Routes.TURNON_NOTIF);

    postRegister(data2);
  }

  var registResonse =
      RegisterModel(success: "", data: null, message: "", error: "").obs;

  postRegister(RegisterStorageModel data) async {
    isLoading.value = true;
    try {
      registResonse.value = (await _registerProvider.Register(data: data))!;
      isLoading.value = false;

      if (registResonse.value.success == "Success") {
        800.milliseconds;
        Get.toNamed(Routes.TURNON_NOTIF);
      } else {
        bottomSheetMessage(
            color: "red", desc: registResonse.value.message ?? "");
      }
    } catch (e) {
      isLoading.value = false;

      debugPrint("error  $e");
    }
  }
}

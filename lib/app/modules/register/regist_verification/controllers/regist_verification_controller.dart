import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heyva/app/modules/register/model/register_storage_model.dart';
import 'package:heyva/app/modules/register/model/verified_model.dart';
import 'package:heyva/app/modules/register/provider/register_provider.dart';
import 'package:heyva/constant/keys.dart';
import 'package:heyva/constant/strings.dart';
import 'package:heyva/services/dio_services.dart';

class RegistVerificationController extends FullLifeCycleController {
  var box = GetStorage();
  var errorMessage = ''.obs;
  var isLoading = false.obs;
  late RefreshDioClient _client;
  late RegisterProvider _registerProvider;

  var boxData = RegisterStorageModel(
          email: "",
          password: "",
          fullName: "",
          birthDate: "",
          pregnancyStatus: "",
          interests: [],
          childBirthDate: "",
          estimateDueDate: "")
      .obs;

  @override
  void onInit() {
    _client = RefreshDioClient();
    _registerProvider = RegisterProvider(_client.init());
    boxData.value = box.read(Keys.registStorage) as RegisterStorageModel;
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    super.dispose();
  }

  var checkVeriviedResonse =
      VerifiedModel(success: "Failed", data: null, message: "", error: "").obs;

  String get buttonTitle {
    var data = checkVeriviedResonse.value;
    if (data.success == "Success") {
      return Strings.continue_text;
    } else {
      return Strings.opemMailApps;
    }
  }

  bool get isVerified {
    var data = checkVeriviedResonse.value;
    debugPrint("response isverified ${data.success}");
    debugPrint(
        "response isverified ${checkVeriviedResonse.value.success.toString()}");
    if (data.success == "Success") {
      return true;
    } else {
      return false;
    }
  }

  cekVerified() async {
    isLoading.value = true;
    try {
      checkVeriviedResonse.value = (await _registerProvider.cekVerified(
        email: boxData.value.email,
      ))!;
      debugPrint(
          "response isverified bawah ${checkVeriviedResonse.value.success.toString()}");

      if (checkVeriviedResonse.value.success == "Success") {
        Future.delayed(1.seconds, () async {
          isLoading.value = false;
        });
      } else {
        isLoading.value = false;
      }
    } catch (e) {
      isLoading.value = false;
      debugPrint("error  $e");
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      debugPrint("Onresume ------ ");
      cekVerified();
    }
  }
}

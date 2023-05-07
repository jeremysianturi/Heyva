import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heyva/app/modules/register/model/register_storage_model.dart';
import 'package:heyva/app/modules/register/model/verified_model.dart';
import 'package:heyva/app/modules/register/provider/register_provider.dart';
import 'package:heyva/app/routes/app_pages.dart';
import 'package:heyva/app/widgets/reusable_bottomSheet_message.dart';
import 'package:heyva/constant/keys.dart';
import 'package:heyva/constant/strings.dart';
import 'package:heyva/services/dio_services.dart';

class RegisterController extends GetxController {
  TextEditingController fullname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  RxBool isObscure = true.obs;
  final box = GetStorage();
  var errorMessage = ''.obs;
  var isFullnameError = false.obs;
  var isEmailError = false.obs;
  var isPassError = false.obs;

  late RefreshDioClient _refreshDioClient;
  late RegisterProvider _registerProvider;

  saveToStorage() {
    var data = RegisterStorageModel(
        email: email.text,
        password: pass.text,
        fullName: fullname.text,
        birthDate: "",
        pregnancyStatus: "",
        interests: [],
        childBirthDate: "",
        estimateDueDate: "");
    box.write(Keys.registStorage, data);
    debugPrint("read data ${box.read(Keys.registStorage)}");
    800.seconds;
    Get.toNamed(Routes.ONBOARDING_ONE,
        arguments: {Keys.fullNameArguments: fullname.text});
    // Get.to(OnBoardingOneView());
  }

  bool get validateData {
    isFullnameError.value = false;
    isEmailError.value = false;
    isPassError.value = false;
    errorMessage.value = "";
    if (fullname.text.isEmpty) {
      isFullnameError.value = true;
      errorMessage.value = Strings.emptyForm;
      return false;
    }
    if (email.text.isEmpty) {
      isEmailError.value = true;
      errorMessage.value = Strings.emptyForm;
      return false;
    }
    if (pass.text.isEmpty) {
      isPassError.value = true;
      errorMessage.value = Strings.emptyForm;
      return false;
    }
    if (!GetUtils.isEmail(email.text)) {
      isEmailError.value = true;
      errorMessage.value = Strings.invalidEmail;
      return false;
    }
    if (pass.text.toString().length < 8) {
      isPassError.value = true;
      errorMessage.value = Strings.atLeast8Char;
      return false;
    }
    return true;
  }

  @override
  void onInit() {
    fullname.text = "testing";
    email.text = "kang-bakso@harakirimail.com";
    pass.text = "minimal88";

    _refreshDioClient = RefreshDioClient();
    _registerProvider = RegisterProvider(_refreshDioClient.init());
    super.onInit();
  }

  @override
  void onClose() {
    fullname.dispose();
    email.dispose();
    pass.dispose();
    super.onClose();
  }

  var isLoading = false.obs;
  var checkVeriviedResonse =
      VerifiedModel(success: "Failed", data: null, message: "", error: "").obs;

  bool get isEmailFree {
    var data = checkVeriviedResonse.value;
    debugPrint("response isverified ${data.success}");
    debugPrint(
        "response isverified ${checkVeriviedResonse.value.success.toString()}");
    if (data.success == "Success") {
      return false;
    } else {
      return true;
    }
  }

  cekVerified() async {
    isLoading.value = true;
    try {
      checkVeriviedResonse.value = (await _registerProvider.cekVerified(
        email: email.text,
      ))!;
      if (checkVeriviedResonse.value.success == "Success") {
        Future.delayed(1.seconds, () async {
          isLoading.value = false;
        });
        bottomSheetMessage(color: "red", desc: "User Already Exists");
      } else {
        // email free
        saveToStorage();
        isLoading.value = false;
      }
    } catch (e) {
      isLoading.value = false;
      debugPrint("error  $e");
    }
  }
}

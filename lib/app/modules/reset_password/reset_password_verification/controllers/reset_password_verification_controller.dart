import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heyva/app/modules/register/model/verified_model.dart';
import 'package:heyva/app/modules/reset_password/provider/reset_password_provider.dart';
import 'package:heyva/constant/keys.dart';
import 'package:heyva/constant/strings.dart';
import 'package:heyva/services/dio_services.dart';

class ResetPasswordVerificationController extends GetxController {
  var box = GetStorage();
  var errorMessage = ''.obs;
  var isLoading = false.obs;
  late RefreshDioClient _client;
  // late ResetPasswordProvider _resetPasswordProvider;
  dynamic argumentData = Get.arguments;

  String get email {
    return argumentData[Keys.resetPasswordEmail].toString();
  }

  @override
  void onInit() {
    _client = RefreshDioClient();
    // _resetPasswordProvider = ResetPasswordProvider(_client.init());
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
    if (data.success == "Success") {
      return true;
    } else {
      return false;
    }
  }
//
// cekVerified() async {
//   isLoading.value = true;
//   try {
//     checkVeriviedResonse.value = (await _registerProvider.cekVerified(
//       email: boxData.value.email,
//     ))!;
//     if (checkVeriviedResonse.value.success == "Success") {
//       Future.delayed(1.seconds, () async {
//         isLoading.value = false;
//       });
//     } else {
//       isLoading.value = false;
//     }
//   } catch (e) {
//     isLoading.value = false;
//     debugPrint("error  $e");
//   }
// }
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heyva/app/modules/profile/model/notification_list_model.dart';
import 'package:heyva/app/modules/profile/model/notification_update_post_model.dart';
import 'package:heyva/app/modules/profile/provider/profile_provider.dart';
import 'package:heyva/app/routes/app_pages.dart';
import 'package:heyva/constant/keys.dart';
import 'package:heyva/services/dio_services.dart';

class TurnOnNotifController extends GetxController {
  RxBool on = false.obs;
  RxBool on2 = false.obs;

  void toggle() => on.value = on.value ? false : true;

  void toggle2() => on2.value = on2.value ? false : true;

  var isLoading = false.obs;
  late DioClient _client;
  late ProfileProvider _profileProvider;
  var errorMessage = ''.obs;
  var box = GetStorage();

  int get length {
    return response.value.data?.length ?? 0;
  }

  @override
  void onInit() {
    _client = DioClient();
    _profileProvider = ProfileProvider(_client.init());
    isLoading.value = true;
    Future.delayed(400.milliseconds, () {
      getNotif();
    });
    super.onInit();
  }

  var response =
      NotificationListModel(success: "", data: null, message: "", error: "")
          .obs;

  getNotif() async {
    errorMessage.value = "";
    try {
      response.value = (await _profileProvider.getNotifList())!;
      isLoading.value = false;
      if (response.value.success == "Success") {
      } else {
        errorMessage.value = response.value.message ?? "Error Message";
      }
    } catch (e) {
      isLoading.value = false;

      debugPrint("error  $e");
    }
  }

  generateRawJson() {
    var termsPrivacy = <String>[];
    var isAgree = <bool>[];

    response.value.data?.forEach((e) {
      termsPrivacy.add(e.id ?? "");
      isAgree.add(e.isAgree ?? false);
    });

    var json = NotificationUpdatePostModel(
      termsPrivacy: termsPrivacy,
      isAgree: isAgree,
    );
    log(" raw json ${json.toJson()}");
    Future.delayed(200.milliseconds, () {
      Get.toNamed(Routes.ONBOARDING_FINISH, arguments: {
        Keys.updatedNotificationArgumentsTermPrivacy: termsPrivacy,
        Keys.updatedNotificationArgumentsIsAgree: isAgree
      });
    });
  }
}

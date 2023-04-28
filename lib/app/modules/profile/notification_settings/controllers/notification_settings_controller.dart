import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heyva/app/modules/profile/model/notification_list_model.dart';
import 'package:heyva/app/modules/profile/model/notification_update_model.dart';
import 'package:heyva/app/modules/profile/model/notification_update_post_model.dart';
import 'package:heyva/app/modules/profile/provider/profile_provider.dart';
import 'package:heyva/services/dio_services.dart';

class NotificationSettingsController extends GetxController {
  var pushNotifStatus = false.obs;
  var programNotifStatus = false.obs;

  var isLoading = false.obs;
  late DioClient _dioClient;
  late ProfileProvider _profileProvider;
  late ProfileProvider _profileProvider2;
  var errorMessage = ''.obs;
  var box = GetStorage();

  int get length {
    return response.value.data?.length ?? 0;
  }

  @override
  void onInit() {
    _dioClient = DioClient();
    _profileProvider = ProfileProvider(_dioClient.init());
    _profileProvider2 = ProfileProvider(_dioClient.init());
    getNotif();
    super.onInit();
  }

  var response =
      NotificationListModel(success: "", data: null, message: "", error: "")
          .obs;

  getNotif() async {
    errorMessage.value = "";
    isLoading.value = true;
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
    updateNotif(data: json.toJson());
  }

  var updateNotifModel =
      NotificationUpdateModel(success: "", data: null, message: "", error: "")
          .obs;

  updateNotif({required data}) async {
    debugPrint("json $data");
    errorMessage.value = "";
    isLoading.value = true;
    try {
      updateNotifModel.value =
          (await _profileProvider2.updatedNotif(json: data))!;
      isLoading.value = false;
      if (updateNotifModel.value.success == "Success") {
        Future.delayed(800.milliseconds, () {
          isLoading.value = false;
        });
      } else {
        errorMessage.value = updateNotifModel.value.message ?? "Error Message";
      }
    } catch (e) {
      isLoading.value = false;
      debugPrint("error  $e");
    }
  }
}

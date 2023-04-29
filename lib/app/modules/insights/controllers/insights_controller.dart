import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heyva/app/modules/insights/model/Insight_model.dart';
import 'package:heyva/app/modules/insights/provider/insight_provider.dart';
import 'package:heyva/app/modules/profile/model/profile_model.dart';
import 'package:heyva/app/modules/profile/provider/profile_provider.dart';
import 'package:heyva/constant/keys.dart';
import 'package:heyva/services/dio_services.dart';
import 'package:intl/intl.dart';

class InsightsController extends GetxController {
  var currentIndex = 1.obs;

  var isLoading = false.obs;
  late DioClient _client;
  late ProfileProvider _profileProvider;
  late InsightProvider _insightProvider;
  var errorMessage = ''.obs;
  var box = GetStorage();

  String get profileName {
    var read = box.read(Keys.profileName) ?? "";
    if (read.toString().isNotEmpty) {
      return box.read(Keys.profileName) ?? "";
    } else {
      return profileResponse.value.data?.fullName ?? "";
    }
  }

  String get profileAvatar {
    var read = box.read(Keys.profileImgUrl) ?? "";
    if (read.toString().isNotEmpty) {
      return box.read(Keys.profileImgUrl) ?? "";
    } else {
      return profileResponse.value.data?.avatar ?? "";
    }
  }

  @override
  void onInit() {
    _client = DioClient();
    _profileProvider = ProfileProvider(_client.init());
    _insightProvider = InsightProvider(_client.init());
    getProfile();
    getInsight();
    super.onInit();
  }

  var profileResponse =
      ProfileModel(success: "", data: null, message: "", error: "").obs;

  getProfile() async {
    errorMessage.value = "";
    isLoading.value = true;
    try {
      profileResponse.value = (await _profileProvider.getProfile())!;
      isLoading.value = false;

      if (profileResponse.value.success == "Success") {
        var data = profileResponse.value.data;
        box.write(Keys.profileName, data?.fullName);
        box.write(Keys.profileEmail, data?.user?.email);
        box.write(Keys.profileImgUrl, data?.avatar);
        box.write(Keys.profilePhone, data?.user?.phoneNumber);
      } else {
        errorMessage.value = profileResponse.value.message ?? "Error Message";
      }
    } catch (e) {
      isLoading.value = false;
      debugPrint("error  $e");
    }
  }

  String get greeting {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    }
    if (hour < 17) {
      return 'Good Afternoon';
    }
    return 'Good Evening';
  }

  var insightResponse =
      InsightModel(success: "", data: null, message: "", error: "").obs;

  getInsight() async {
    errorMessage.value = "";
    isLoading.value = true;
    try {
      var data = (await _insightProvider.getInsight(
        date1: DateFormat('yyyy-MM-dd').format(DateTime.now()),
        date2: DateFormat('yyyy-MM-dd')
            .format(DateTime.now().subtract(const Duration(days: 1))),
        date3: DateFormat('yyyy-MM-dd')
            .format(DateTime.now().subtract(const Duration(days: 2))),
      ))!;
      isLoading.value = false;

      if (data.success == "Success") {
        data.data?.forEach((e) {
          e.insight?.forEach((el) {
            el.response
                ?.firstWhereOrNull((elm) =>
                    elm.trackerDetail?.title == "What do you experience?")
                ?.trackerDetail
                ?.title = "You experience :";
          });
        });
        insightResponse.value = data;
        insightResponse.refresh();
      } else {
        errorMessage.value = insightResponse.value.message ?? "Error Message";
      }
    } catch (e) {
      isLoading.value = false;
      debugPrint("error  $e");
    }
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heyva/app/modules/mood_tracker/recomendation2/model/recomendation_model.dart';
import 'package:heyva/app/modules/mood_tracker/recomendation2/provider/recomendation_provider.dart';
import 'package:heyva/services/dio_services.dart';
import 'package:intl/intl.dart';

class Recomendation2Controller extends GetxController {
  var isLoading = false.obs;
  late DioClient _client;
  late RecomendationProvider _recomendationProvider;
  var errorMessage = ''.obs;
  var box = GetStorage();

  @override
  void onInit() {
    _client = DioClient();
    _recomendationProvider = RecomendationProvider(_client.init());
    getRecomendation();
    super.onInit();
  }

  var recomendationResponse =
      RecomendationModel(success: "", data: null, message: "", error: "").obs;

  getRecomendation() async {
    errorMessage.value = "";
    isLoading.value = true;
    var now = DateTime.now();
    var formatter = DateFormat('yyyy-MM-dd');
    try {
      recomendationResponse.value = (await _recomendationProvider
          .getRecomendation(date: formatter.format(now).toString()))!;
      isLoading.value = false;

      if (recomendationResponse.value.success == "Success") {
      } else {
        errorMessage.value =
            recomendationResponse.value.message ?? "Error Message";
      }
    } catch (e) {
      isLoading.value = false;
      debugPrint("error  $e");
    }
  }
}

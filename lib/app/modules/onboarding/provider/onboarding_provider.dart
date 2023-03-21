import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:heyva/app/modules/onboarding/model/interests_tag_model.dart';
import 'package:heyva/app/modules/onboarding/model/pregnancy_status_model.dart';

class OnboardingProviders {
  final Dio _client;

  OnboardingProviders(this._client);

  Future<PregnancyStatusModel?> getPregnancyStatus() async {
    PregnancyStatusModel? res;
    try {
      Response response = await _client.get(
        '/api/v1/dictionary/get-by-type?type=PREGNANCY_STATUS&search=',
      );
      debugPrint('response data: ${response.data}');
      res = PregnancyStatusModel.fromJson(response.data);
    } on DioError catch (e) {
      var message = e.response?.data['message'];
      var error = e.response?.data['error'];
      res = PregnancyStatusModel(success: "", data: null, message: message, error: error);
    }
    return res;
  }
  Future<InterestsTagModel?> getInterestsTags() async {
    InterestsTagModel? res;
    try {
      Response response = await _client.get(
        '/api/v1/dictionary/get-by-type?type=INTERESTS_TAG&search=',
      );
      debugPrint('response data: ${response.data}');
      res = InterestsTagModel.fromJson(response.data);
    } on DioError catch (e) {
      var message = e.response?.data['message'];
      var error = e.response?.data['error'];
      res = InterestsTagModel(success: "", data: null, message: message, error: error);
    }
    return res;
  }
}

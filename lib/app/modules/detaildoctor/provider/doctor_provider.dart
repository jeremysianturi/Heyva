import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:heyva/app/modules/detaildoctor/model/detail_doctor_model.dart';
import 'package:heyva/app/modules/detaildoctor/model/doctor_list_model.dart';

class DoctorProvider {
  final Dio _client;

  DoctorProvider(this._client);

  Future<DoctorListModel?> getListDoctor() async {
    DoctorListModel? res;
    try {
      Response response = await _client.get(
        '/api/v1/doctor/list',
      );
      debugPrint('response data: ${response.data}');
      res = DoctorListModel.fromJson(response.data);
    } on DioError catch (e) {
      var message = e.response?.data['message'];
      var error = e.response?.data['error'];
      res = DoctorListModel(
          success: "", data: null, message: message, error: error);
    }
    return res;
  }

  Future<DetailDoctorModel?> getDetailDoctor({required String id}) async {
    DetailDoctorModel? res;
    try {
      Response response = await _client.get(
        '/api/v1/doctor/$id',
      );
      debugPrint('response data: ${response.data}');
      res = DetailDoctorModel.fromJson(response.data);
    } on DioError catch (e) {
      var message = e.response?.data['message'];
      var error = e.response?.data['error'];
      res = DetailDoctorModel(
          success: "", data: null, message: message, error: error);
    }
    return res;
  }
}

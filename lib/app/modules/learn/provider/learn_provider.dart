import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:heyva/app/modules/learn/model/program_list_model.dart';
import 'package:heyva/app/modules/learn/model/program_personal_create_model.dart';
import 'package:heyva/app/modules/learn/model/program_personal_tracker_create_model.dart';
import 'package:heyva/app/modules/learn/model/program_personal_tracker_finish_model.dart';

class LearnProvider {
  final Dio _client;

  LearnProvider(this._client);

  Future<ProgramListModel?> getProgramList() async {
    ProgramListModel? res;
    try {
      Response response = await _client.get(
        '/api/v1/program/list?search=',
      );
      debugPrint('response data: ${response.data}');
      res = ProgramListModel.fromJson(response.data);
    } on DioError catch (e) {
      var message = e.response?.data['message'];
      var error = e.response?.data['error'];
      res = ProgramListModel(
          success: "", data: null, message: message, error: error);
    }
    return res;
  }

  Future<ProgramPersonalCreateModel?> programPersonalCreate(
      {required programId}) async {
    ProgramPersonalCreateModel? res;
    try {
      Response response = await _client.post('/api/v1/program-personal/create',
          data: {"program": programId});
      debugPrint('response data: ${response.data}');
      res = ProgramPersonalCreateModel.fromJson(response.data);
    } on DioError catch (e) {
      var message = e.response?.data['message'];
      var error = e.response?.data['error'];
      res = ProgramPersonalCreateModel(
          success: "", data: null, message: message, error: error);
    }
    return res;
  }

  Future<ProgramPersonalTrackerCreateModel?> programPersonalTrackerCreate(
      {required programId, required programIdChild}) async {
    ProgramPersonalTrackerCreateModel? res;
    try {
      Response response = await _client.post(
          '/api/v1/program-personal-tracker/create',
          data: {"program": programId, "child_program": programIdChild});
      debugPrint('response data: ${response.data}');
      res = ProgramPersonalTrackerCreateModel.fromJson(response.data);
    } on DioError catch (e) {
      var message = e.response?.data['message'];
      var error = e.response?.data['error'];
      res = ProgramPersonalTrackerCreateModel(
          success: "", data: null, message: message, error: error);
    }
    return res;
  }

  Future<ProgramPersonalTrackerFinishModel?> programPersonalTrackerFinish(
      {required programId}) async {
    ProgramPersonalTrackerFinishModel? res;
    try {
      Response response = await _client.put(
        '/api/v1/program-personal-tracker/finish/$programId',
      );
      debugPrint('response data: ${response.data}');
      res = ProgramPersonalTrackerFinishModel.fromJson(response.data);
    } on DioError catch (e) {
      var message = e.response?.data['message'];
      var error = e.response?.data['error'];
      res = ProgramPersonalTrackerFinishModel(
          success: "", data: null, message: message, error: error);
    }
    return res;
  }
}

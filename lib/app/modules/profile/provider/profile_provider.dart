import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:heyva/app/modules/profile/model/change_password_model.dart';
import 'package:heyva/app/modules/profile/model/notification_list_model.dart';
import 'package:heyva/app/modules/profile/model/notification_update_model.dart';
import 'package:heyva/app/modules/profile/model/profile_model.dart';
import 'package:heyva/app/modules/profile/model/update_profile_model.dart';

class ProfileProvider {
  final Dio _client;

  ProfileProvider(this._client);

  Future<ProfileModel?> getProfile() async {
    ProfileModel? res;
    try {
      Response response = await _client.get(
        '/api/v1/profile',
      );
      debugPrint('response data: ${response.data}');
      res = ProfileModel.fromJson(response.data);
    } on DioError catch (e) {
      var message = e.response?.data['message'];
      var error = e.response?.data['error'];
      res =
          ProfileModel(success: "", data: null, message: message, error: error);
    }
    return res;
  }

  Future<ChangePasswordModel?> changePassword(
      {required oldPassword,
      required newPassword,
      required confPassword}) async {
    ChangePasswordModel? res;
    try {
      Response response =
          await _client.put('/api/v1/users/change-password', data: {
        "old_password": oldPassword,
        "new_password": newPassword,
        "confirm_new_password": confPassword,
      });
      debugPrint('response data: ${response.data}');
      res = ChangePasswordModel.fromJson(response.data);
    } on DioError catch (e) {
      var message = e.response?.data['message'];
      var error = e.response?.data['error'];
      res = ChangePasswordModel(
          success: "", data: null, message: message, error: error);
    }
    return res;
  }

  Future<UpdateProfileModel?> updateProfile({
    required File file,
    required String fullName,
    required bool isEmptyFile,
  }) async {
    UpdateProfileModel? res;
    FormData formData;

    try {
      String fileName = file.path.split('/').last;

      if (isEmptyFile) {
        formData = FormData.fromMap({"full_name": fullName});
      } else {
        formData = FormData.fromMap({
          "avatar": await MultipartFile.fromFile(file.path, filename: fileName),
          "full_name": fullName
        });
      }

      Response response =
          await _client.put('/api/v1/profile/update', data: formData);
      debugPrint('response data: ${response.data}');
      res = UpdateProfileModel.fromJson(response.data);
    } on DioError catch (e) {
      var message = e.response?.data['message'];
      var error = e.response?.data['error'];
      res = UpdateProfileModel(
          success: "", data: null, message: message, error: error);
    }
    return res;
  }

  Future<NotificationListModel?> getNotifList() async {
    NotificationListModel? res;
    try {
      Response response = await _client.get(
        '/api/v1/terms-privacy/list?type=NOTIFICATION_SUPPORT&type=NOTIFICATION_PROMOTION',
      );
      debugPrint('response data: ${response.data}');
      res = NotificationListModel.fromJson(response.data);
    } on DioError catch (e) {
      var message = e.response?.data['message'];
      var error = e.response?.data['error'];
      res = NotificationListModel(
          success: "", data: null, message: message, error: error);
    }
    return res;
  }

  Future<NotificationUpdateModel?> updatedNotif({required json}) async {
    NotificationUpdateModel? res;
    try {
      Response response = await _client.post(
        '/api/v1/terms-privacy-personal/create-list',
        data: jsonEncode(json),
      );
      debugPrint('response data: ${response.data}');
      res = NotificationUpdateModel.fromJson(response.data);
    } on DioError catch (e) {
      var message = e.response?.data['message'];
      var error = e.response?.data['error'];
      res = NotificationUpdateModel(
          success: "", data: null, message: message, error: error);
    }
    return res;
  }
}

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:heyva/app/modules/related_program/model/content_list_model.dart';
import 'package:heyva/app/modules/related_program/model/tags_model.dart';

class RelatedProgramProvider {
  final Dio _client;

  RelatedProgramProvider(this._client);

  Future<TagsModel?> getTags() async {
    TagsModel? res;
    try {
      Response response = await _client.get(
        '/api/v1/dictionary/get-by-type?type=INTERESTS_TAG',
      );
      debugPrint('response data: ${response.data}');
      res = TagsModel.fromJson(response.data);
    } on DioError catch (e) {
      var message = e.response?.data['message'];
      var error = e.response?.data['error'];
      res = TagsModel(success: "", data: null, message: message, error: error);
    }
    return res;
  }

  Future<ContentListModel?> getContentList({required tagId}) async {
    ContentListModel? res;
    var tag = tagId != "" ? "tag=$tagId" : "";
    try {
      Response response = await _client.get(
        '/api/v1/content/list?$tag',
      );
      debugPrint('response data: ${response.data}');
      res = ContentListModel.fromJson(response.data);
    } on DioError catch (e) {
      var message = e.response?.data['message'];
      var error = e.response?.data['error'];
      res = ContentListModel(
          success: "", data: null, message: message, error: error);
    }
    return res;
  }

  Future<ContentListModel?> getDetailContent({required contentID}) async {
    ContentListModel? res;
    try {
      Response response = await _client.get(
        '/api/v1/content/$contentID',
      );
      debugPrint('response data: ${response.data}');
      res = ContentListModel.fromJson(response.data);
    } on DioError catch (e) {
      var message = e.response?.data['message'];
      var error = e.response?.data['error'];
      res = ContentListModel(
          success: "", data: null, message: message, error: error);
    }
    return res;
  }
}

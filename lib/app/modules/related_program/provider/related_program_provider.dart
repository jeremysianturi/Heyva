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
        '/api/v1/dictionary/get-by-type?type=INTERESTS_TAG&id=33914c3e-0c63-4d78-96d5-cccf4cef0a0f&id=89b2aae1-7981-48da-ae9f-7116f1b5e007&id=ba0a4579-0848-4661-97ee-fe7e41bdf558&id=deba8feb-5352-4f01-b85b-bd8c25ec55ea&id=f9e70a98-8fd7-46c3-ab41-4bdce9ad3fda&id=b921ef45-0c23-4227-8b84-1a658d396563&id=9c47708c-2fc4-43e7-b516-a1a2c5eb9dc6',
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

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:heyva/app/modules/article/model/detail_article_model.dart';

class ArticleProvider {
  final Dio _client;

  ArticleProvider(this._client);

  Future<DetailArticleModel?> getDetailArticle({required var contentId}) async {
    DetailArticleModel? res;
    try {
      Response response = await _client.get(
        '/api/v1/article/$contentId',
      );
      debugPrint('response data: ${response.data}');
      res = DetailArticleModel.fromJson(response.data);
    } on DioError catch (e) {
      var message = e.response?.data['message'];
      var error = e.response?.data['error'];
      res = DetailArticleModel(
        success: "",
        data: null,
        message: message,
        error: error,
      );
    }
    return res;
  }
}

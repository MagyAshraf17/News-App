import 'dart:convert';
import 'dart:developer';

import 'package:news_app/core/cofigrations/constants.dart';
import 'package:news_app/model/artical_model.dart';

import 'package:http/http.dart' as http;

class ApiArticles {
  static Future<List<Article>> fetchSourcesList(String sourceId) async {
    var url = Uri.https(Constants.domain, "/v2/top-headlines", {
      "apiKey": Constants.apiKey,
      "sources": sourceId,
    });

    final response = await http.get(url);
    log(response.statusCode.toString());
    log(url.origin + url.path + url.query);
    log(response.body.toString());

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      ArticlesModel articlesModel = ArticlesModel.fromJson(data);
      return articlesModel.articles;
    } else {
      throw Exception("Faild to get source.....");
    }
  }
}

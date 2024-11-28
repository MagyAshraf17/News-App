import 'dart:convert';
import 'dart:developer';

import 'package:news_app/core/cofigrations/constants.dart';
import 'package:news_app/model/source_model.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  static Future<List<Source>> fetchSourcesList(String categoryID) async {
    var url = Uri.https(Constants.domain, "/v2/top-headlines/sources",
        {"apiKey": Constants.apiKey, "category": categoryID});

    final response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      SourceModel sourceModel = SourceModel.fromJson(data);
      return sourceModel.source;
    } else {
      throw Exception("Faild to get source.....");
    }
  }
}

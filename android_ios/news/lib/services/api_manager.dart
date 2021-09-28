import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/constants/constant.dart';
import 'package:news/models/news_info.dart';

class ApiManager {
  Future<NewsModel> getNews() async {
    var client = http.Client();
    var newsModel = null;
    try {
      var response = await client.get(Constant.new_url);

      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        newsModel = NewsModel.fromJson(jsonMap);
      }
    } catch (Exception) {
      return newsModel;
    }
  }
}

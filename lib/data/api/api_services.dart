import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;

import '../../main.dart';
import '../model/NewsResponseDto.dart';
import '../model/SourcesResponseDto.dart';
import '../model/top_headline_response_dto.dart';
import 'api_const.dart';

class ApiServices {
  //TopHeadLine
  static Future<TopHeadLineResponseDto?> showTopHeadlines() async {
    Uri url = Uri.https(ApiConst.baseUrl, ApiConst.topHeadline, {
      "apiKey": "e95cd10d78a34503b157d2ba843dd535",
      "country": "us",
      "category": "general",
    });
    try {
      var response = await http.get(url);
      var responseString = response.body;
      var json = jsonDecode(responseString);

      var topHeadlineResponse = TopHeadLineResponseDto.fromJson(json);
      return topHeadlineResponse;
    } catch (e) {
      print(e);
    }
    return null;
  }

  //getSource
  static Future<SourcesResponseDto?> getSources(String categoryId) async {
    Uri url = Uri.https(ApiConst.baseUrl, ApiConst.sourcesApi,
        {"apiKey": "e95cd10d78a34503b157d2ba843dd535", "category": categoryId});
    var response = await http.get(url);
    var responseString = response.body;

    var json = jsonDecode(responseString);
    var sourcesResponse = SourcesResponseDto.fromJson(json);
    return sourcesResponse;
  }

  static Future<NewsResponseDto?> getNews(String sourceId,
      {String? query, int pageSize = 5, int page = 1}) async {
    Uri url = Uri.https(ApiConst.baseUrl, ApiConst.newsApi, {
      "apiKey": "8127c264b4d64821900aa79b6826db4e",
      "sources": sourceId,
      "q": query,
      "pageSize": pageSize.toString(),
      "page": page.toString()
    });
    try {
      var response = await http.get(url);
      var responseString = response.body; //String
      var json = jsonDecode(responseString); //json
      return NewsResponseDto.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }
}

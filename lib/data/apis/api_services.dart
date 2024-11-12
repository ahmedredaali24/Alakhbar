import 'dart:convert';

import 'package:alakhbar/data/apis/api_const.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;

import '../model/top_headline_response_dto.dart';

class ApiServices {
  static Future<TopHeadLineResponseDto?> showTopHeadlines() async {
    Uri url = Uri.https(ApiConst.basUrl, ApiConst.topHeadline, {
      "apiKey": "e95cd10d78a34503b157d2ba843dd535",
      "country": "us",
      "category": "sport",
    });
    var response = await http.get(url);
    var responseString = response.body;
    var json = jsonDecode(responseString);
    var topHeadlineResponse = TopHeadLineResponseDto.fromJson(json);
    return topHeadlineResponse;
  }
}

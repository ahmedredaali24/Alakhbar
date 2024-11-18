import 'dart:convert';

import 'package:alakhbar/data/api/offline_services.dart';
import 'package:alakhbar/data/model/top_headline_response_dto.dart';
import 'package:alakhbar/domin/entity/TopHeadLines.dart';
import 'package:alakhbar/domin/repository/data_sources/top_headline_data_source.dart';

import '../../../main.dart';
import '../../api/api_services.dart';

class TopHeadlineDataSourceImpl implements TopHeadlineDataSource {
  @override
  Future<TopHeadLinesEntity?> showTopHeadline() async {
    return await ApiServices.showTopHeadlines();
  }
}

class TopHeadlineOfflineDataSourceImpl implements TopHeadLineOfflineDataSource {
  @override
  Future<TopHeadLinesEntity?> showTopHeadline() async {
    return await OfflineServices.getFromPrefs(
        fromJson: TopHeadLineResponseDto.fromJson, key: "topHeadline");
    // String? jsonString = await prefs?.getString("key");
    // if (jsonString != null) {
    //   return TopHeadLineResponseDto.fromJson(jsonDecode(jsonString));
    // }
    // return null;
  }

  @override
  saveTopHeadLine(TopHeadLinesEntity? response) async {
    await OfflineServices.saveTopHead(response, "topHeadline");
    // String jsonString = jsonEncode(response?.toJson());
    // await prefs?.setString("key", jsonString);
  }
}

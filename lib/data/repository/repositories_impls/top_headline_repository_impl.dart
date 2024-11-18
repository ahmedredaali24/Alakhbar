import 'package:alakhbar/data/api/api_services.dart';
import 'package:alakhbar/domin/entity/TopHeadLines.dart';
import 'package:alakhbar/domin/repository/data_sources/top_headline_data_source.dart';
import 'package:alakhbar/domin/repository/repositories/top_headline_repository.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../../model/top_headline_response_dto.dart';

class TopHeadlineRepositoryImpl implements TopHeadlineRepository {
  final TopHeadLineOfflineDataSource offline;
  final TopHeadlineDataSource topHeadlineDataSource;

  TopHeadlineRepositoryImpl(
      {required this.topHeadlineDataSource, required this.offline});

  @override
  Future<TopHeadLinesEntity?> showTopHeadline() async {
    try {
      final List<ConnectivityResult> connectivityResult =
          await (Connectivity().checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.none)) {
        return offline.showTopHeadline();
      }
      var response = await topHeadlineDataSource.showTopHeadline();
      offline.saveTopHeadLine(response);
      return response;
    } catch (e) {
      print(e);
    }
    return null;
  }
}

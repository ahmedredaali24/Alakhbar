import 'package:alakhbar/data/apis/api_services.dart';
import 'package:alakhbar/domin/entity/TopHeadLines.dart';
import 'package:alakhbar/domin/repository/data_sources/top_headline_data_source.dart';

class TopHeadlineDataSourceImpl implements TopHeadlineDataSource {
  @override
  Future<TopHeadLinesEntity?> showTopHeadline() {
    return ApiServices.showTopHeadlines();
  }
}

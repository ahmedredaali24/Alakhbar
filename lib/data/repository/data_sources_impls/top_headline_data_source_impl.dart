
import 'package:alakhbar/domin/entity/TopHeadLines.dart';
import 'package:alakhbar/domin/repository/data_sources/top_headline_data_source.dart';

import '../../api/api_services.dart';

class TopHeadlineDataSourceImpl implements TopHeadlineDataSource {
  @override
  Future<TopHeadLinesEntity?> showTopHeadline() async {
    return await ApiServices.showTopHeadlines();
  }
}

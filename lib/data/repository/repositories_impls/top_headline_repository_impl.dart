import 'package:alakhbar/domin/entity/TopHeadLines.dart';
import 'package:alakhbar/domin/repository/data_sources/top_headline_data_source.dart';
import 'package:alakhbar/domin/repository/repositories/top_headline_repository.dart';

class TopHeadlineRepositoryImpl implements TopHeadlineRepository {
  TopHeadlineDataSource topHeadlineDataSource;

  TopHeadlineRepositoryImpl({required this.topHeadlineDataSource});

  @override
  Future<TopHeadLinesEntity?> showTopHeadline() {
    return topHeadlineDataSource.showTopHeadline();
  }
}

import '../../../data/model/top_headline_response_dto.dart';
import '../../entity/TopHeadLines.dart';

abstract class TopHeadlineDataSource {
  Future<TopHeadLinesEntity?> showTopHeadline();
}

abstract class TopHeadLineOfflineDataSource {
  Future<TopHeadLinesEntity?> showTopHeadline();

  saveTopHeadLine(TopHeadLinesEntity? response);
}

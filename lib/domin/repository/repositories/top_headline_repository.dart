import '../../../data/model/top_headline_response_dto.dart';
import '../../entity/TopHeadLines.dart';

abstract class TopHeadlineRepository {
  Future<TopHeadLinesEntity?> showTopHeadline();
}


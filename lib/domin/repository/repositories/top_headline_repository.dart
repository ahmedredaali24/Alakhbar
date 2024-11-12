import '../../entity/TopHeadLines.dart';

abstract class TopHeadlineRepository {
  Future<TopHeadLinesEntity?> showTopHeadline();
}

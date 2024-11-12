import '../../entity/TopHeadLines.dart';

abstract class TopHeadlineDataSource {
  Future<TopHeadLinesEntity?> showTopHeadline();
}

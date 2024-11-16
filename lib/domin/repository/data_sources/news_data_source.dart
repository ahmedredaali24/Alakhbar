import '../../entity/NewsResponseEntity.dart';

abstract class NewsDataSource {
  Future<NewsResponseEntity?> getNews(String sourceId);
}

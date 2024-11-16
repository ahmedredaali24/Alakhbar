import '../../entity/NewsResponseEntity.dart';

abstract class NewsRepository {
  Future<NewsResponseEntity?> getNews(String sourceId);
}

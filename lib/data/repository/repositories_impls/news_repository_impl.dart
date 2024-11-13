import 'package:alakhbar/domin/entity/NewsResponseEntity.dart';
import 'package:alakhbar/domin/repository/data_sources/news_data_source.dart';
import 'package:alakhbar/domin/repository/repositories/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository {
  NewsDataSource newsDataSource;

  NewsRepositoryImpl({required this.newsDataSource});

  @override
  Future<NewsResponseEntity?> getNews(String sourceId) {
    return newsDataSource.getNews(sourceId);
  }
}

import 'package:alakhbar/domin/entity/NewsResponseEntity.dart';
import 'package:alakhbar/domin/repository/repositories/news_repository.dart';

class GetNewsUseCase {
  final NewsRepository newsRepository;

  GetNewsUseCase({required this.newsRepository});

  Future<NewsResponseEntity?> invoke(String sourceId) {
    return newsRepository.getNews(sourceId);
  }
}

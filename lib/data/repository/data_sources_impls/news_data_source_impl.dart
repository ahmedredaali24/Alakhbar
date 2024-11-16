import 'package:alakhbar/data/api/api_services.dart';
import 'package:alakhbar/domin/entity/NewsResponseEntity.dart';
import 'package:alakhbar/domin/repository/data_sources/news_data_source.dart';

class NewsDataSourceImpl implements NewsDataSource {
  @override
  Future<NewsResponseEntity?> getNews(String sourceId) async {
    return await ApiServices.getNews(sourceId);
  }
}

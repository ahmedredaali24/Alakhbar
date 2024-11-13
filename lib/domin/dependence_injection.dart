import 'package:alakhbar/data/repository/data_sources_impls/news_data_source_impl.dart';
import 'package:alakhbar/data/repository/data_sources_impls/sources_data_source_impl.dart';
import 'package:alakhbar/data/repository/data_sources_impls/top_headline_data_source_impl.dart';
import 'package:alakhbar/data/repository/repositories_impls/news_repository_impl.dart';
import 'package:alakhbar/data/repository/repositories_impls/sources_repository_impl.dart';
import 'package:alakhbar/data/repository/repositories_impls/top_headline_repository_impl.dart';
import 'package:alakhbar/domin/repository/data_sources/news_data_source.dart';
import 'package:alakhbar/domin/repository/data_sources/source_data_source.dart';
import 'package:alakhbar/domin/repository/data_sources/top_headline_data_source.dart';
import 'package:alakhbar/domin/repository/repositories/news_repository.dart';
import 'package:alakhbar/domin/repository/repositories/source_repository.dart';
import 'package:alakhbar/domin/repository/repositories/top_headline_repository.dart';
import 'package:alakhbar/domin/use_case/get_news_use_case.dart';
import 'package:alakhbar/domin/use_case/get_sources_use_case.dart';
import 'package:alakhbar/domin/use_case/top_headline_use_case.dart';

///topHeadlines
TopHeadlineUseCase injectTopHeadlineUseCase() {
  return TopHeadlineUseCase(
      topHeadlineRepository: injectTopHeadlineRepository());
}

TopHeadlineRepository injectTopHeadlineRepository() {
  return TopHeadlineRepositoryImpl(
      topHeadlineDataSource: injectTopHeadlineDataSource());
}

TopHeadlineDataSource injectTopHeadlineDataSource() {
  return TopHeadlineDataSourceImpl();
}

///sources
GetSourcesUseCase injectGetSourcesUseCase() {
  return GetSourcesUseCase(sourcesRepository: injectSourcesRepository());
}

SourcesRepository injectSourcesRepository() {
  return SourcesRepositoryImpl(sourceDataSource: injectSourceDataSource());
}

SourceDataSource injectSourceDataSource() {
  return SourcesDataSourceImpl();
}

///News
GetNewsUseCase injectGetNewsUseCase() {
  return GetNewsUseCase(newsRepository: injectNewsRepository());
}

NewsRepository injectNewsRepository() {
  return NewsRepositoryImpl(newsDataSource: injectNewsDataSource());
}

NewsDataSource injectNewsDataSource() {
  return NewsDataSourceImpl();
}

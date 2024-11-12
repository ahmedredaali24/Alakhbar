import 'package:alakhbar/data/repository/data_sources_impls/top_headline_data_source_impl.dart';
import 'package:alakhbar/data/repository/repositories_impls/top_headline_repository_impl.dart';
import 'package:alakhbar/domin/repository/data_sources/top_headline_data_source.dart';
import 'package:alakhbar/domin/repository/repositories/top_headline_repository.dart';
import 'package:alakhbar/domin/use_case/top_headline_use_case.dart';

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

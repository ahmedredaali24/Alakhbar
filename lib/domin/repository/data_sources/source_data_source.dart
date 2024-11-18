import '../../entity/SourcesResponseEntity.dart';

abstract class SourceDataSource {
  Future<SourcesResponseEntity?> getSources(String categoryId);
}

abstract class SourcesOfflineDataSource {
  Future<SourcesResponseEntity?> showTopHeadline(String categoryId);

  saveTopHeadLine(SourcesResponseEntity? response,String categoryId);
}

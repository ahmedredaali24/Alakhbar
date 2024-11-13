import '../../entity/SourcesResponseEntity.dart';

abstract class SourceDataSource {
  Future<SourcesResponseEntity?> getSources(String categoryId);
}

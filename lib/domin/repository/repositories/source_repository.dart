import '../../entity/SourcesResponseEntity.dart';

abstract class SourcesRepository {
  Future<SourcesResponseEntity?> getSources(String categoryId);
}

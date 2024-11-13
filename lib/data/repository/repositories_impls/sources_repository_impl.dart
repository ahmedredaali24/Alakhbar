import 'package:alakhbar/domin/entity/SourcesResponseEntity.dart';
import 'package:alakhbar/domin/repository/data_sources/source_data_source.dart';

import '../../../domin/repository/repositories/source_repository.dart';

class SourcesRepositoryImpl implements SourcesRepository {
  final SourceDataSource sourceDataSource;

  SourcesRepositoryImpl({required this.sourceDataSource});

  @override
  Future<SourcesResponseEntity?> getSources(String categoryId) {
    return sourceDataSource.getSources(categoryId);
  }
}

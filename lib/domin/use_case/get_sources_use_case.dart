import 'package:alakhbar/domin/repository/repositories/source_repository.dart';

import '../entity/SourcesResponseEntity.dart';

class GetSourcesUseCase {
  final SourcesRepository sourcesRepository;

  GetSourcesUseCase({required this.sourcesRepository});

  Future<SourcesResponseEntity?> invoke(String categoryId) {
    return sourcesRepository.getSources( categoryId);
  }
}

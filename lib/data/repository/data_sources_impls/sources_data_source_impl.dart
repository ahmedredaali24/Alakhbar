import 'package:alakhbar/data/api/api_services.dart';
import 'package:alakhbar/domin/entity/SourcesResponseEntity.dart';
import 'package:alakhbar/domin/repository/data_sources/source_data_source.dart';

import '../../api/offline_services.dart';
import '../../model/SourcesResponseDto.dart';

class SourcesDataSourceImpl implements SourceDataSource {
  @override
  Future<SourcesResponseEntity?> getSources(String categoryId) async {
    return await ApiServices.getSources(categoryId);
  }
}

class SourcesOfflineDataSourceImpl implements SourcesOfflineDataSource {
  @override
  saveTopHeadLine(SourcesResponseEntity? response, String categoryId) async {
    await OfflineServices.saveTopHead(response, categoryId);
  }

  @override
  Future<SourcesResponseEntity?> showTopHeadline(String categoryId) async {
    return await OfflineServices.getFromPrefs(
        fromJson: SourcesResponseDto.fromJson, key: categoryId);
  }
}

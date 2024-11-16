import 'package:alakhbar/data/api/api_services.dart';
import 'package:alakhbar/domin/entity/SourcesResponseEntity.dart';
import 'package:alakhbar/domin/repository/data_sources/source_data_source.dart';

class SourcesDataSourceImpl implements SourceDataSource {
  @override
  Future<SourcesResponseEntity?> getSources(String categoryId) async {
    return await ApiServices.getSources(categoryId);
  }
}

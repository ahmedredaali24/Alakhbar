import 'package:alakhbar/domin/entity/SourcesResponseEntity.dart';
import 'package:alakhbar/domin/repository/data_sources/source_data_source.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../../../domin/repository/repositories/source_repository.dart';

class SourcesRepositoryImpl implements SourcesRepository {
  final SourceDataSource sourceDataSource;
  final SourcesOfflineDataSource offline;

  SourcesRepositoryImpl(
      {required this.sourceDataSource, required this.offline});

  @override
  Future<SourcesResponseEntity?> getSources(String categoryId) async {
    try {
      final List<ConnectivityResult> connectivityResult =
          await (Connectivity().checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.none)) {
        return offline.showTopHeadline(categoryId);
      }
      var response = await sourceDataSource.getSources(categoryId);
      offline.saveTopHeadLine(response, categoryId);
      return response;
    } catch (e) {
      print(e);
    }
    return null;
  }
}

import 'package:alakhbar/ui/home/news/cubit/states.dart';
import 'package:bloc/bloc.dart';

import '../../../../../../domin/entity/SourcesResponseEntity.dart';
import '../../../../../../domin/use_case/get_sources_use_case.dart';
import '../../../../domin/entity/NewsResponseEntity.dart';
import '../../../../domin/use_case/get_news_use_case.dart';

class NewsScreenViewModel extends Cubit<NewsScreeStates> {
  final GetSourcesUseCase getSourcesUseCase;
  final GetNewsUseCase getNewsUseCase;

  NewsScreenViewModel({
    required this.getNewsUseCase,
    required this.getSourcesUseCase,
  }) : super(NewsScreenInitialState());

  List<SourcesEntity?> sourcesList = [];

  List<NewsEntity?> newsList = [];
  int selectedIndex = 0;

  void updateSelectedIndex(int index) {
    selectedIndex = index;
    emit(NewsScreenIndexChangedState(selectedIndex));
  }

  getSources(String categoryId) async {
    try {
      var response = await getSourcesUseCase.invoke(categoryId);
      print("Response: $response");
      sourcesList = response?.sources ?? [];
      emit(NewsScreenSuccessState());
    } catch (e) {
      print(e);
    }
  }

  getNews(String sourceId) async {
    try {
      var response = await getNewsUseCase.invoke(sourceId);
      print("Response: $response");
      newsList = response?.articles ?? [];
      emit(NewsScreenSuccessState());
    } catch (e) {
      print(e);
    }
  }
}

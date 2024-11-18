import 'package:alakhbar/ui/home/tabs/home_view_tab/cubit/states.dart';
import 'package:bloc/bloc.dart';

import '../../../../../domin/entity/TopHeadLines.dart';

import '../../../../../domin/use_case/top_headline_use_case.dart';

class HomeViewViewModel extends Cubit<TopHeadlineStates> {
  TopHeadlineUseCase topHeadlineUseCase;

  HomeViewViewModel({
    required this.topHeadlineUseCase,
  }) : super(TopHeadlineInitialState());
  List<ArticlesEntity?> topHeadlineData = [];

  void showTopHeadlines() async {
    emit(TopHeadlineLoadingState());
    try {
      var response = await topHeadlineUseCase.invoke();

      topHeadlineData = response?.articles ?? [];

      emit(TopHeadlineSuccessState());
    } catch (e) {
      emit(TopHeadlineErrorState(errorMessage: "Something is Wrong!"));
      print("catch error$e");
    }
  }
}

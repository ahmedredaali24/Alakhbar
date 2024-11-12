import '../../../../../domin/entity/TopHeadLines.dart';

abstract class TopHeadlineStates {}

class TopHeadlineInitialState extends TopHeadlineStates {}

class TopHeadlineLoadingState extends TopHeadlineStates {}

class TopHeadlineSuccessState extends TopHeadlineStates {


}

class TopHeadlineErrorState extends TopHeadlineStates {
  String? errorMessage;

  TopHeadlineErrorState({required this.errorMessage});
}

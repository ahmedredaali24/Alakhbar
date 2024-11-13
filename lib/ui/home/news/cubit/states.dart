abstract class NewsScreeStates {}

class NewsScreenInitialState extends NewsScreeStates {}

class NewsScreenIndexChangedState extends NewsScreeStates {
  final int selectedIndex;

  NewsScreenIndexChangedState(this.selectedIndex);
}

class NewsScreenSuccessState extends NewsScreeStates {}

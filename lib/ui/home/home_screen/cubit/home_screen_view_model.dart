import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../tabs/category/category_selection_view.dart';
import '../../tabs/favorite/favorite.dart';
import '../../tabs/home_view_tab/home_view.dart';
import 'home_states.dart';

class HomeScreenViewModel extends Cubit<HomeStates> {
  HomeScreenViewModel() : super(HomeInitialState());

  //todo: hold data - handle logic
  int selectedIndex = 0;
  List<Widget> tabs = [
    HomeView(),
    CategorySelectionView(),
    Favorite(),
  ];

  void changeTabs(int newSelectedIndex) {
    emit(HomeInitialState());
    selectedIndex = newSelectedIndex;
    emit(ChangeBottomNavigationBarStates());
  }
}

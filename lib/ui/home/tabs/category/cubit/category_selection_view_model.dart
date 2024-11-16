import 'package:alakhbar/ui/home/tabs/category/cubit/states.dart';
import 'package:bloc/bloc.dart';

class CategorySelectionViewModel extends Cubit<CategorySelectionStates> {
  CategorySelectionViewModel() :super(CategoryInitialState());

  List<String> categoryList = [
    "Sports",
    "General",
    "Technology",
    "Business",
    "Entertainment",
    "Health",
  ];


}
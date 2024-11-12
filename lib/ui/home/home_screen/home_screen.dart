import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/widgets/components/custom_button_navigation_bar.dart';

import 'cubit/home_screen_view_model.dart';
import 'cubit/home_states.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'HomeScreenView';

  final HomeScreenViewModel viewModel = HomeScreenViewModel();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenViewModel, HomeStates>(
        bloc: viewModel,
        builder: (context, state) {
          return Scaffold(
            bottomNavigationBar: buildCustomBottomNavigationBar(
              context: context,
              selectedIndex: viewModel.selectedIndex,
              onTapFunction: (index) {
                viewModel.changeTabs(index);
              },
            ),
            body: viewModel.tabs[viewModel.selectedIndex],
          );
        });
  }
}

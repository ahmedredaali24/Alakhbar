import 'package:alakhbar/domin/dependence_injection.dart';
import 'package:alakhbar/ui/home/news/tabs/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../tabs/category/category_article_view.dart';
import 'cubit/news_screen_view_model.dart';
import 'cubit/states.dart';

class NewsScreen extends StatelessWidget {
  static const String routeName = "NewsScreen";
  final String categoryId;

  NewsScreen({super.key, required this.categoryId});

  final NewsScreenViewModel viewModel = NewsScreenViewModel(
      getSourcesUseCase: injectGetSourcesUseCase(),
      getNewsUseCase: injectGetNewsUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsScreenViewModel, NewsScreeStates>(
      bloc: viewModel..getSources(categoryId),
      builder: (context, state) {
        if (state is NewsScreenSuccessState ||
            state is NewsScreenIndexChangedState) {
          if (viewModel.newsList.isEmpty) {
            viewModel.getNews(viewModel.sourcesList[0]?.id ?? "");
          }

          return DefaultTabController(
            length: viewModel.sourcesList.length,
            child: Scaffold(
              appBar: AppBar(
                toolbarHeight: 50,
              ),
              body: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  TabBar(
                      onTap: (index) {
                        viewModel.updateSelectedIndex(index);
                        String? selectedSourceId =
                            viewModel.sourcesList[index]?.id;
                        if (selectedSourceId != null) {
                          viewModel.getNews(selectedSourceId);
                        }
                      },
                      indicatorColor: Colors.transparent,
                      isScrollable: true,
                      tabs: viewModel.sourcesList
                          .map((sources) => TapItem2(
                                sourceEntity: sources,
                                isSelected: viewModel.selectedIndex ==
                                    viewModel.sourcesList.indexOf(sources),
                              ))
                          .toList()),
                  Expanded(
                      child: CategoryArticleView(
                    newsList: viewModel.newsList,
                    categoryName: categoryId,
                  ))
                ],
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}

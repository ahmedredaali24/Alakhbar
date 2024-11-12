import 'package:alakhbar/domin/dependence_injection.dart';
import 'package:alakhbar/ui/home/tabs/home_view_tab/cubit/home_view_view_model.dart';
import 'package:alakhbar/ui/home/tabs/home_view_tab/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../utils/mythemes.dart';
import '../../../utils/widgets/components/gradient_container_widget.dart';
import '../../../utils/widgets/tiles/news_article_tile_widget.dart';

class HomeView extends StatelessWidget {
  static const String routeName = "HomeView";

  HomeView({super.key});

  HomeViewViewModel viewModel =
      HomeViewViewModel(topHeadlineUseCase: injectTopHeadlineUseCase());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Discover",
                style: MyTheme.myTheme.textTheme.displayLarge,
              ),

              Text(
                "Read your favourite news articles in just one click",
                style: MyTheme.myTheme.textTheme.displaySmall,
              ),

              const GradientContainer(),
              const SizedBox(
                height: 25,
              ),

              Text(
                "Top headlines",
                style: MyTheme.myTheme.textTheme.labelMedium,
              ),

              // Mapping the ListView data
              BlocBuilder<HomeViewViewModel, TopHeadlineStates>(
                bloc: viewModel..showTopHeadlines(),
                builder: (context, state) {

                  if (state is TopHeadlineLoadingState) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.red,
                      ),
                    );
                  }
                  if (state is TopHeadlineSuccessState) {
                    return SizedBox(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: viewModel.topHeadlineData.length,
                        itemBuilder: (context, index) {
                          // Return your news article tile widget here based on index
                          return NewsArticleTile(
                            onPressedFavorite: () {},
                            onTap: () {},
                            author:
                                viewModel.topHeadlineData[index]?.author ?? '',
                            title: viewModel.topHeadlineData[index]?.title ?? '',
                            date:viewModel.topHeadlineData[index]?.publishedAt ?? '',
                            imageUrl: viewModel.topHeadlineData[index]?.urlToImage ?? '',
                            articleUrl: viewModel.topHeadlineData[index]?.url ?? '',
                          ).animate().slideX(
                              begin: -10,
                              end: 0,
                              duration: const Duration(seconds: 1),
                              curve: Curves.fastEaseInToSlowEaseOut,
                              delay: Duration(milliseconds: 200 * index));
                        },

                      ),

                    );

                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

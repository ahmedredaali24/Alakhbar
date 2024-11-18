import 'package:alakhbar/data/api/api_services.dart';
import 'package:alakhbar/domin/dependence_injection.dart';
import 'package:alakhbar/main.dart';
import 'package:alakhbar/ui/home/tabs/home_view_tab/cubit/home_view_view_model.dart';
import 'package:alakhbar/ui/home/tabs/home_view_tab/cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/mythemes.dart';
import '../../../utils/widgets/components/gradient_container_widget.dart';
import '../../../utils/widgets/tiles/news_article_tile_widget.dart';
import '../../details_screen/details_screen.dart';

class HomeView extends StatelessWidget {
  static const String routeName = "HomeView";

  HomeView({super.key});

  HomeViewViewModel viewModel = HomeViewViewModel(
    // saveTopHeadlineUseCase: injectSaveTopHeadlineUseCase(),
    topHeadlineUseCase: injectTopHeadlineUseCase(),
    // getSavedTopHeadlineUseCase: injectGetSavedTopHeadlineUseCase(),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(15.r),
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
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
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
                    return const Center(
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
                            onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return DetailsScreen(
                                  title:
                                      viewModel.topHeadlineData[index]?.title ??
                                          "",
                                  author: viewModel
                                          .topHeadlineData[index]?.author ??
                                      "",
                                  content: viewModel
                                          .topHeadlineData[index]?.content ??
                                      "",
                                  publishedAt: viewModel.topHeadlineData[index]
                                          ?.publishedAt ??
                                      "",
                                  url: viewModel.topHeadlineData[index]?.url ??
                                      "",
                                  urlToImage: viewModel
                                          .topHeadlineData[index]?.urlToImage ??
                                      "",
                                );
                              }));
                            },
                            author:
                                viewModel.topHeadlineData[index]?.author ?? '',
                            title:
                                viewModel.topHeadlineData[index]?.title ?? '',
                            date:
                                viewModel.topHeadlineData[index]?.publishedAt ??
                                    '',
                            imageUrl:
                                viewModel.topHeadlineData[index]?.urlToImage ??
                                    '',
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

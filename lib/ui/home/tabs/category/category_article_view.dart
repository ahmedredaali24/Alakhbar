import 'package:alakhbar/data/model/top_headline_response_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:simple_gradient_text/simple_gradient_text.dart';
import '../../../../domin/entity/NewsResponseEntity.dart';
import '../../../utils/mythemes.dart';
import '../../../utils/widgets/tiles/news_article_tile_widget.dart';

class CategoryArticleView extends StatelessWidget {
  final String categoryName;

  final List<NewsEntity?> newsList;

  const CategoryArticleView(
      {super.key, required this.categoryName, required this.newsList});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // Column children
            children: [
              // Text
              GradientText(
                "$categoryName related articles",
                style: const TextStyle(
                    fontSize: 28, fontWeight: FontWeight.w600, height: 1),
                colors: [
                  MyTheme.myTheme.colorScheme.primary,
                  MyTheme.myTheme.colorScheme.secondary,
                  MyTheme.myTheme.colorScheme.tertiary,
                ],
              ),

              //sized box
              const SizedBox(
                height: 9,
              ),

              // Text
              Text(
                "Read all articles related to the category of ${categoryName.toLowerCase()} and explore more categories as per your personal interests, preferences and enjoy reading.",
                style: MyTheme.myTheme.textTheme.displaySmall,
              ),

              //mapping the articles
              SizedBox(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: newsList.length,
                  itemBuilder: (context, index) {
                    // Return your news article tile widget here based on index
                    return NewsArticleTile(
                      onPressedFavorite: () {},
                      onTap: () {

                      },
                      author: newsList[index]?.author ?? "Unknown",
                      title: newsList[index]?.title ?? "Unknown",
                      date: newsList[index]?.publishedAt ?? "",
                      imageUrl: newsList[index]?.urlToImage,
                      //imageUrl
                    )

                        //adding the required animations at the end
                        .animate()
                        .slideX(
                            begin: -10,
                            end: 0,
                            duration: const Duration(seconds: 1),
                            curve: Curves.fastEaseInToSlowEaseOut,
                            delay: Duration(milliseconds: 200 * index));
                  },
                ),
              ),
            ]),
      ),
    ));
  }
}

import 'package:alakhbar/ui/home/details_screen/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        padding: EdgeInsets.all(20.r),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // Column children
            children: [
              // Text
              GradientText(
                "$categoryName related articles",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  height: .9.h,
                ),
                colors: [
                  MyTheme.myTheme.colorScheme.primary,
                  MyTheme.myTheme.colorScheme.secondary,
                  MyTheme.myTheme.colorScheme.tertiary,
                ],
              ),

              //sized box
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
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
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return DetailsScreen(
                            title: newsList[index]?.title ?? "",
                            author: newsList[index]?.author ?? "",
                            content: newsList[index]?.content ?? "",
                            publishedAt: newsList[index]?.publishedAt ?? "",
                            url: newsList[index]?.url ?? "",
                            urlToImage: newsList[index]?.urlToImage ?? "",
                          );
                        }));
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

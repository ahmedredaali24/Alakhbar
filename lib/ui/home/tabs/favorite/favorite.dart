import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/mythemes.dart';
import '../../../utils/widgets/tiles/news_article_tile_widget.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(22.r),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Your Favorite",
                style: MyTheme.myTheme.textTheme.displayLarge,
              ),

               SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),

              // Mapping the ListView data
              SizedBox(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    // Return your news article tile widget here based on index
                    return NewsArticleTile(
                      onPressedFavorite: () {},
                      onTap: () {},
                      author: "author",
                      title: "title",
                      date: "date",
                      imageUrl: "imageUrl",
                      // articleUrl: " articleUrl",
                    ).animate().slideX(
                        begin: -10,
                        end: 0,
                        duration: const Duration(seconds: 1),
                        curve: Curves.fastEaseInToSlowEaseOut,
                        delay: Duration(milliseconds: 200 * index));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

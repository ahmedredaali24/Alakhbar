import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../utils/mythemes.dart';
import '../../../utils/widgets/tiles/category_tile_widget.dart';

class CategorySelectionView extends StatelessWidget {
  const CategorySelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> categoryList = [
      "sports",
      "general",
      "Technology",
      "Business",
      "Environment",
      "Health",
    ];

    return Scaffold(
      //bottom navigation

      //main content to be returned
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text
            Text(
              "Categories",
              style: MyTheme.myTheme.textTheme.displayLarge,
            ),

            // Text
            Text(
              "Read about various categories as per your interests",
              style: MyTheme.myTheme.textTheme.displaySmall,
            ),

            //categories mapping within the gridview
            Expanded(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 25,
                  ),
                  itemCount: categoryList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        // categoryBloc.add(ClickedOnCategoryEvent(categoryName: categoryList[index]));
                      },
                      child: CategoryTileWidget(
                              categoryImagePath: "assets/main/${index + 1}.png",
                              categoryName: categoryList[
                                  index]) //adding the required animations at the end

                          //adding the animate addon
                          .animate()

                          //adding fadeIn effect
                          .fadeIn(
                              duration: const Duration(seconds: 2),
                              curve: Curves.decelerate)

                          //adding the shimmer effect
                          .shimmer(
                              duration: const Duration(seconds: 3),
                              curve: Curves.fastEaseInToSlowEaseOut),
                    );
                  }),
            )
          ],
        ),
      )),
    );
  }
}

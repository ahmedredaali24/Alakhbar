import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../utils/mythemes.dart';
import '../../../utils/widgets/tiles/category_tile_widget.dart';
import '../../news/news_screen.dart';
import 'cubit/category_selection_view_model.dart';

class CategorySelectionView extends StatelessWidget {
  const CategorySelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    CategorySelectionViewModel viewModel = CategorySelectionViewModel();
    return SafeArea(
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
                itemCount: viewModel.categoryList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return NewsScreen(
                          categoryId: viewModel.categoryList[index],
                        );
                      }));
                    },
                    child: CategoryTileWidget(
                            categoryImagePath: "assets/main/${index + 1}.png",
                            categoryName: viewModel.categoryList[
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
    ));
  }
}

import 'package:alakhbar/domin/entity/TopHeadLines.dart';
import 'package:alakhbar/ui/home/details_screen/cubit/details_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class DetailsScreen extends StatelessWidget {
  final ArticlesEntity? articlesEntity;

  DetailsScreen({super.key, required this.articlesEntity});

  final DetailsScreenViewModel viewModel = DetailsScreenViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            articlesEntity?.title ?? "",
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: articlesEntity?.urlToImage != null
                      ? Image.network(
                          "${articlesEntity?.urlToImage}",
                          width: 118,
                          height: 300,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            }
                            return Container(
                                color: Colors.black12,
                                width: 118,
                                height: 118,
                                child: LoadingAnimationWidget.fourRotatingDots(
                                    color: Colors.black54, size: 30));
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              width: 118,
                              height: 118,
                              color: Colors.black12,
                              child: const Icon(Icons.error_outline, size: 40),
                            );
                          },
                        )
                      : Container(
                          height: 118,
                          width: 118,
                          color: Colors.black12,
                          child: const Icon(Icons.photo, size: 40),
                        ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  articlesEntity?.author ?? "Unknown",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: Colors.grey),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  articlesEntity?.content ?? "Unknown",
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  DateFormat.yMMM().format(
                      DateTime.parse(articlesEntity?.publishedAt ?? "Unknown")),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: Colors.grey),
                  textAlign: TextAlign.end,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                TextButton(
                    onPressed: () async {
                      viewModel.moreDetails("${articlesEntity?.url}");
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "For More Details",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const Icon(
                          color: Colors.black,
                          Icons.arrow_right,
                          size: 50,
                        )
                      ],
                    )),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ));
  }
}

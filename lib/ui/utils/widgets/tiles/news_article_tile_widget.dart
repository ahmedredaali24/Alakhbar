import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../mythemes.dart';
import '../helpers/button_widget.dart';

class NewsArticleTile extends StatelessWidget {
  final String? author;
  final String? date;
  final String? title;
  final String? imageUrl;
  final Function onTap;
  final Function onPressedFavorite;

  const NewsArticleTile({
    super.key,
    required this.author,
    required this.date,
    required this.title,
    required this.imageUrl,
    required this.onTap,
    required this.onPressedFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.h, left: 2.w, right: 2.w),
      child: Column(
        children: [
          Row(
            children: [
              // Left part: Image
              ClipRRect(
                borderRadius: BorderRadius.circular(5.r),
                child: imageUrl != null
                    ? Image.network(
                        imageUrl.toString(),
                        width: 100.w,
                        height: 100.h,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          }
                          return Container(
                              color: Colors.black12,
                              width: 100.w,
                              height: 100.h,
                              child: LoadingAnimationWidget.fourRotatingDots(
                                  color: Colors.black54, size: 30.r));
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 100.w,
                            height: 100.h,
                            color: Colors.black12,
                            child: Icon(Icons.error_outline, size: 30.r),
                          );
                        },
                      )
                    : Container(
                        width: 100.w,
                        height: 100.h,
                        color: Colors.black12,
                        child: Icon(Icons.photo, size: 30.r),
                      ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.03),

              // Content
              SizedBox(
                width: 200.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Author and uploading date
                    Text(
                      author != null && date != null
                          ? "${author!.length > 15 ? author!.substring(0, 15) : author}... ${date!.split("T")[0]}"
                          : "Source unknown",
                      style: MyTheme.myTheme.textTheme.displaySmall,
                    ),

                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.003),

                    // Title of the article
                    Text(
                      title ?? "",
                      maxLines: 3,
                      style: MyTheme.myTheme.textTheme.displayMedium,
                    ),

                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.005),

                    // Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ButtonWidget(
                          onTap: () {
                            onTap();
                          },
                          height: 28.h,
                          width: 110.62.w,
                        ),
                        IconButton(
                          onPressed: () {
                            onPressedFavorite();
                          },
                          icon: const Icon(Icons.favorite_border),
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Separator line
          Container(
            margin: EdgeInsets.only(top: 12.h),
            color: Colors.black26,
            width: double.maxFinite,
            height: 0.5.h,
          ),
        ],
      ),
    );
  }
}

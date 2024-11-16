import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryTileWidget extends StatelessWidget {
  final String categoryImagePath;
  final String categoryName;

  const CategoryTileWidget(
      {super.key, required this.categoryImagePath, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    //stack
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        //to show the background image
        ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Image.asset(
              color: Colors.black26,
              colorBlendMode: BlendMode.darken,
              categoryImagePath,
              width: 200.w,
              height: 115.h,
              fit: BoxFit.cover,
            )),

        //to show the front layer text representing the category name
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 3.w),
          child: Text(
            overflow: TextOverflow.ellipsis,
            categoryName,
            style: TextStyle(
                color: Colors.white,
                fontSize: 17.sp,
                fontWeight: FontWeight.w700),
          ),
        )
      ],
    );
  }
}

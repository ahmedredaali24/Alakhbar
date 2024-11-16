import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../mythemes.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.h),
      width: double.maxFinite,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.r),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                MyTheme.myTheme.colorScheme.primary,
                MyTheme.myTheme.colorScheme.secondary,
                MyTheme.myTheme.colorScheme.tertiary
              ])),
      child: Padding(
        padding: EdgeInsets.all(15.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Alakhbar",
              style: MyTheme.myTheme.textTheme.labelLarge,
            ),
            Text(
              "Introducing Alakhbar, the go-to platform for all your news needs! Whether you're into global affairs, tech innovations, sports highlights, entertainment buzz, or financial insights. We bring you the latest updates tailored to your interests. ",
              style: MyTheme.myTheme.textTheme.labelSmall,
            )
          ],
        ),
      ),
    )

        //required animations
        .animate()
        .fade(duration: const Duration(seconds: 2))
        .shimmer(duration: const Duration(seconds: 2));
  }
}

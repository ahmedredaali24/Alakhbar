import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../mythemes.dart';

class ButtonWidget extends StatelessWidget {
  final double height;
  final double width;
  final Function onTap;

  const ButtonWidget(
      {super.key,
      required this.height,
      required this.width,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          color: Colors.black,
        ),
        child: Center(
          child: Text(
            'Read more',
            style: MyTheme.myTheme.textTheme.labelSmall,
          ),
        ),
      ),
    );
  }
}

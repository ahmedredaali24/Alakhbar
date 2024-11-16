import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../domin/entity/SourcesResponseEntity.dart';

class TapItem extends StatelessWidget {
  final bool isSelected;
  final SourcesEntity? sourceEntity;

  const TapItem(
      {super.key, required this.isSelected, required this.sourceEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(bottom: 0.h),
      padding: EdgeInsets.symmetric(vertical: 5.w, horizontal: 12.w),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.green, width: 1.r),
          borderRadius: BorderRadius.circular(12.r),
          color: isSelected ? Colors.red : Colors.transparent),
      child: Text(
        sourceEntity?.name ?? 'Unknown',
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: isSelected ? Colors.white : Colors.green,
              fontSize: 15.sp,
            ),
      ),
    );
  }
}

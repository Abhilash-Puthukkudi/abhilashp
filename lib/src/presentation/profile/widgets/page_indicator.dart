import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_test/src/presentation/core/constants/app_colors.dart';

class PageIndicator extends StatelessWidget {
  final int length, currentIndex;

  const PageIndicator({
    super.key,
    required this.length,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 3.h,
      child: ListView.builder(
        itemCount: length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container(
          margin: EdgeInsets.only(right: 5.w),
          decoration: BoxDecoration(
              color: currentIndex == index
                  ? AppColors.primaryColor
                  : AppColors.grey,
              borderRadius: BorderRadius.circular(12)),
          width: 30.w,
        ),
      ),
    );
  }
}

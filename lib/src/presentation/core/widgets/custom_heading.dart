import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomHeading extends StatelessWidget {
  final bool hideViewAll;
  final String title;
  final VoidCallback ontap;
  const CustomHeading({
    super.key,
    required this.title,
    required this.ontap,
    this.hideViewAll = false,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 16.w,
        ).copyWith(top: 20.h, bottom: 15.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
            ),
            InkWell(
              splashColor: Colors.transparent,
              onTap: ontap,
              child: Text(
                "View All",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.underline),
              ),
            )
          ],
        ),
      ),
    );
  }
}

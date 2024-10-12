import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_test/src/presentation/core/constants/app_typography.dart';

class Heading extends StatelessWidget {
  const Heading({
    super.key,
    required this.heading,
    required this.seeAllButtonTap,
  });

  final String heading;
  final VoidCallback seeAllButtonTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            heading,
            style: AppTypography.avacadoSemiBold.copyWith(fontSize: 14.sp),
          ),
          InkWell(
            onTap: seeAllButtonTap,
            child: Text(
              "See All",
              style: AppTypography.avacadoMedium.copyWith(
                  fontSize: 13.sp, color: Theme.of(context).primaryColor),
            ),
          )
        ],
      ),
    );
  }
}

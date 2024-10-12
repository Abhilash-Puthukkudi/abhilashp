import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_test/src/presentation/core/constants/app_colors.dart';
import 'package:machine_test/src/presentation/core/constants/app_typography.dart';

class ProfileIntrestButton extends StatelessWidget {
  const ProfileIntrestButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(bottom: 3.h),
      margin: EdgeInsets.only(bottom: 2.h),
      height: 35.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: AppColors.primaryColor,
      ),
      child: Text(
        "Sent Intrest",
        style: AppTypography.avacadoMedium.copyWith(color: AppColors.white),
      ),
    );
  }
}

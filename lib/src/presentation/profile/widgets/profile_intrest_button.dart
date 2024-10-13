import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_test/src/presentation/core/constants/app_colors.dart';
import 'package:machine_test/src/presentation/core/constants/app_typography.dart';

class ProfileIntrestButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback ontap;
  const ProfileIntrestButton({
    super.key,
    required this.text,
    required this.color,
    required this.ontap,
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
        color: color,
      ),
      child: InkWell(
        onTap: ontap,
        child: Text(
          text,
          style: AppTypography.avacadoMedium.copyWith(color: AppColors.white),
        ),
      ),
    );
  }
}

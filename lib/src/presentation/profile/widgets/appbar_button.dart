import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_test/src/presentation/core/constants/app_colors.dart';

class AppBarButton extends StatelessWidget {
  final VoidCallback ontap;
  final IconData icon;
  final Color color;
  const AppBarButton({super.key, required this.icon, required this.ontap, this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        alignment: Alignment.center,
        width: 40.w,
        height: 40.h,
        decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.black.withOpacity(0.2)),
        child: Icon(
          size: 20.w,
          icon,
          color: color,
        ),
      ),
    );
  }
}

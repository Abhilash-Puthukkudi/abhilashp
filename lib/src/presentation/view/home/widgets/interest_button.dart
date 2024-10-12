import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_test/src/presentation/core/constants/app_colors.dart';
import 'package:machine_test/src/presentation/core/constants/app_typography.dart';

class IntrestButton extends StatelessWidget {
  final VoidCallback onPressed;

  const IntrestButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              elevation: 0,
              overlayColor: AppColors.primaryColor,
              minimumSize: Size(double.infinity, 25.h),
              backgroundColor: Colors.white,
              side: BorderSide(
                color: AppColors.primaryColor,
                width: 1.0.w, // Border width
              ),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
            ),
            onPressed: onPressed,
            child: Text("Sent Intrest",
                style: AppTypography.avacadoRegular
                    .copyWith(color: AppColors.primaryColor)),
          ),
        ),
      ],
    );
  }
}

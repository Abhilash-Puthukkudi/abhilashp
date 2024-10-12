import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_test/src/presentation/core/constants/app_colors.dart';
import 'package:machine_test/src/presentation/core/constants/app_typography.dart';

class SentButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SentButton({
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
              overlayColor: Colors.green,
              minimumSize: Size(double.infinity, 25.h),
              backgroundColor: Colors.green,
              side: BorderSide(
                color: Colors.green,
                width: 1.0.w, // Border width
              ),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
            ),
            onPressed: onPressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Intrest Sent", style: AppTypography.avacadoRegular.copyWith(fontSize: 14.sp, color: AppColors.white)),
                Icon(
                  size: 18.h,
                  Icons.check,
                  color: Colors.white,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

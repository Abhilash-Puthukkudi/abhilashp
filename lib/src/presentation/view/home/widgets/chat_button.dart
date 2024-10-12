import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_test/src/presentation/core/constants/app_colors.dart';
import 'package:machine_test/src/presentation/core/constants/app_typography.dart';

class ChatButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ChatButton({
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
              overlayColor: AppColors.white,
              minimumSize: Size(double.infinity, 25.h),
              backgroundColor: Colors.white,
              side: BorderSide(
                color: AppColors.grey,
                width: 1.0.w, // Border width
              ),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
            ),
            onPressed: onPressed,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Chat",
                  style: AppTypography.avacadoRegular.copyWith(fontSize: 15.sp, color: AppColors.grey),
                ),
                Icon(
                  size: 15.h,
                  color: AppColors.grey,
                  Icons.sms,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

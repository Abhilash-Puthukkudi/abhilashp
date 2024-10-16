import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_test/src/presentation/core/constants/app_typography.dart';

class RejectedButton extends StatelessWidget {
  final VoidCallback onPressed;

  const RejectedButton({
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
              overlayColor: Colors.red,
              minimumSize: Size(double.infinity, 25.h),
              backgroundColor: Colors.red,
              side: BorderSide(
                color: Colors.red,
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
                  "Rejected",
                  style: AppTypography.avacadoRegular.copyWith(fontSize: 15.sp, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

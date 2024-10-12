import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SentRejectButton extends StatelessWidget {
  final VoidCallback onAcceptPressed;
  final VoidCallback onRejectPressed;
  const SentRejectButton({super.key, required this.onAcceptPressed, required this.onRejectPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              onPressed: onAcceptPressed,
              child: Icon(
                size: 18.h,
                Icons.check,
                color: Colors.white,
              )),
        ),
        Expanded(
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                elevation: 0,
                overlayColor: Colors.white,
                minimumSize: Size(double.infinity, 25.h),
                backgroundColor: Colors.white,
                side: BorderSide(
                  color: Colors.white,
                  width: 1.0.w, // Border width
                ),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
              ),
              onPressed: onRejectPressed,
              child: Icon(
                size: 18.h,
                Icons.close,
                color: Colors.red,
              )),
        ),
      ],
    );
  }
}

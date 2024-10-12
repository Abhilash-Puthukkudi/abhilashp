import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_test/src/presentation/core/constants/app_typography.dart';

class CustomChip extends StatelessWidget {
  final String text;
  const CustomChip({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final List<Color> lightColors = [
      Colors.yellow[100]!, // Light Yellow
      Colors.lightBlue[100]!, // Light Blue
      Colors.red[100]!, // Light Red
    ];
    final randomIndex = Random().nextInt(lightColors.length);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: lightColors[randomIndex],
      ),
      child: Text(
        text,
        style: AppTypography.avacadoThin,
        textAlign: TextAlign.center, // Center text horizontally
      ),
    );
  }
}

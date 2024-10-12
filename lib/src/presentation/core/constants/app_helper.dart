import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_test/src/presentation/core/constants/app_typography.dart';

class AppHelper {
  static void showCustomSnackBar(
      BuildContext context, String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        showCloseIcon: true,
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
        content: Center(
          child: Text(
            message,
            style: AppTypography.avacadoMedium.copyWith(
              color: Colors.white,
              fontSize: 14.sp,
            ),
          ),
        ),
      ),
    );
  }

  static String calculateAge(String dob) {
    try {
      DateTime birthDate = DateTime.parse(dob);
      DateTime currentDate = DateTime.now();

      int age = currentDate.year - birthDate.year;

      if (currentDate.month < birthDate.month ||
          (currentDate.month == birthDate.month &&
              currentDate.day < birthDate.day)) {
        age--;
      }

      return "${age}yrs";
    } on Exception catch (e) {
      if (kDebugMode) {
        log(e.toString());
      }
      return "";
    }
  }

  static String convertCmToFeet(String heightInCm) {
    try {
      double heightCm = double.parse(heightInCm);

      double heightFeet = heightCm * 0.0328084;

      int feet = heightFeet.floor();

      double inches = (heightFeet - feet) * 12;
      int inchesRounded = inches.round();

      return "$feet'$inchesRounded\"";
    } catch (e) {
      return "";
    }
  }
}

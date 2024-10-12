import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_test/src/presentation/core/constants/app_colors.dart';
import 'package:machine_test/src/presentation/core/constants/app_typography.dart';

class LoginTextFiled extends StatelessWidget {
  final String label;
  final String hintText;
  final IconData icon;
  final TextEditingController textEditingController;
  final bool obscureText;
  const LoginTextFiled({
    super.key,
    required this.label,
    this.obscureText = false,
    required this.hintText,
    required this.icon,
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    const authOutlineInputBorder = OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFF757575)),
      borderRadius: BorderRadius.all(Radius.circular(100)),
    );

    return TextFormField(
      obscureText: obscureText,
      controller: textEditingController,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          hintText: hintText,
          labelText: label,
          labelStyle: AppTypography.avacadoThin
              .copyWith(color: const Color(0xFF757575)),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintStyle: AppTypography.avacadoThin
              .copyWith(color: const Color(0xFF757575)),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 24.w,
            vertical: 16.h,
          ),
          suffix: Icon(
            icon,
            color: AppColors.primaryColor,
          ),
          border: authOutlineInputBorder,
          enabledBorder: authOutlineInputBorder,
          focusedBorder: authOutlineInputBorder.copyWith(
              borderSide: const BorderSide(color: Color(0xFFFF7643)))),
    );
  }
}

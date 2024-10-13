import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_test/app/router/router_constants.dart';
import 'package:machine_test/src/application/auth/auth_bloc.dart';
import 'package:machine_test/src/application/core/status.dart';
import 'package:machine_test/src/domain/core/models/pm_models/pm_login_model/pm_login_model.dart';
import 'package:machine_test/src/presentation/core/constants/app_colors.dart';
import 'package:machine_test/src/presentation/core/constants/app_helper.dart';
import 'package:machine_test/src/presentation/core/constants/app_images.dart';
import 'package:machine_test/src/presentation/core/constants/app_typography.dart';
import 'package:machine_test/src/presentation/view/auth/widget/login_text_filed.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  final TextEditingController _usernameController = TextEditingController(text: "AbhilashP");
  final TextEditingController _passwordController = TextEditingController(text: "User@123");
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listenWhen: (previous, current) => previous.loginStatus != current.loginStatus,
      listener: (context, state) {
        if (state.loginStatus is StatusSuccess) {
          Navigator.popAndPushNamed(context, RouterConstants.homeRoute);
        } else if (state.loginStatus is StatusFailure) {
          final status = state.loginStatus as StatusFailure;
          AppHelper.showCustomSnackBar(context, status.errorMessage, Colors.red);
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: Column(children: [
                  SizedBox(
                    height: 100.h,
                  ),
                  Image.asset(
                    AppImages.logo,
                    color: AppColors.primaryColor,
                    height: 100.h,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Welcome Back",
                    style: AppTypography.avacadoBold.copyWith(
                      color: Colors.black,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    "Sign in with your username and password",
                    textAlign: TextAlign.center,
                    style: AppTypography.avacadoThin.copyWith(color: const Color(0xFF757575)),
                  ),
                  // const SizedBox(height: 16),
                  SizedBox(
                    height: 20.h,
                  ),
                  Form(
                    child: Column(
                      children: [
                        LoginTextFiled(
                          textEditingController: _usernameController,
                          hintText: "Enter your username",
                          icon: Icons.person,
                          label: "Username",
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        LoginTextFiled(
                          obscureText: true,
                          textEditingController: _passwordController,
                          hintText: "Enter your Password",
                          icon: Icons.lock,
                          label: "password",
                        ),
                        SizedBox(height: 15.h),
                        BlocBuilder<AuthBloc, AuthState>(
                          buildWhen: (previous, current) => previous.loginStatus != current.loginStatus,
                          builder: (context, state) {
                            return ElevatedButton(
                              onPressed: () {
                                PmLoginModel pmLoginModel = PmLoginModel(username: _usernameController.text.trim(), password: _passwordController.text.trim());
                                context.read<AuthBloc>().add(LoginEvent(loginModel: pmLoginModel));
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: const Color(0xFFFF7643),
                                foregroundColor: const Color.fromARGB(255, 62, 32, 32),
                                minimumSize: const Size(double.infinity, 48),
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(16)),
                                ),
                              ),
                              child: state.loginStatus is StatusLoading
                                  ? SizedBox(
                                      width: 25.w,
                                      height: 25.h,
                                      child: CircularProgressIndicator(
                                        color: AppColors.white,
                                        strokeCap: StrokeCap.round,
                                        backgroundColor: AppColors.primaryColor.withOpacity(0.8),
                                      ),
                                    )
                                  : state.loginStatus is StatusSuccess
                                      ? Text(
                                          "Please Wait",
                                          style: AppTypography.avacadoExtraBold.copyWith(color: AppColors.white),
                                        )
                                      : Text(
                                          "Continue",
                                          style: AppTypography.avacadoExtraBold.copyWith(color: AppColors.white),
                                        ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

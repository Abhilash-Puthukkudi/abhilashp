import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_test/app/router/router_constants.dart';
import 'package:machine_test/src/application/auth/auth_bloc.dart';
import 'package:machine_test/src/application/core/status.dart';
import 'package:machine_test/src/presentation/core/constants/app_colors.dart';
import 'package:machine_test/src/presentation/core/constants/app_helper.dart';
import 'package:machine_test/src/presentation/core/constants/app_images.dart';
import 'package:machine_test/src/presentation/core/constants/app_typography.dart';
import 'package:machine_test/src/presentation/view/home/widgets/all_matches_list.dart';

import 'package:machine_test/src/presentation/view/home/widgets/new_list.dart';
import 'package:machine_test/src/presentation/view/home/widgets/suggested_list.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listenWhen: (previous, current) => previous.logoutStatus != current.logoutStatus,
      listener: (context, state) {
        if (state.logoutStatus is StatusSuccess) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            RouterConstants.loginRoute,
            (route) => false,
          );
        }
      },
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
              leadingWidth: ScreenUtil().screenWidth,
              stretch: false,
              snap: false,
              toolbarHeight: 190.h,
              floating: false,
              pinned: false, // Keep the
              leading: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _appLogo(),
                    _menuButton(context),
                    _seaarchBarAndHeading(),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  const AllMatchesList(),
                  const SuggesionsList(),
                  const NewList(),
                  SizedBox(
                    height: 120.h,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column _seaarchBarAndHeading() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(text: TextSpan(children: [TextSpan(text: "Interact With Your ", style: AppTypography.avacadoThin.copyWith(fontSize: 20.sp)), TextSpan(text: "Happiness !", style: AppTypography.avacadoThin.copyWith(color: AppColors.primaryColor, fontSize: 20.sp, fontWeight: FontWeight.w300))])),
        // Collapsible content: Text and search bar

        const SizedBox(height: 12.0),
        Container(
          height: 45.0.h,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9),
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              const BoxShadow(
                color: Colors.black,
              ),
              BoxShadow(
                color: Colors.white70,
                spreadRadius: -1.0,
                blurRadius: 5.0.r,
              ),
            ],
          ),
          child: TextFormField(
            style: AppTypography.avacadoRegular.copyWith(fontSize: 14.sp),
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              hintText: 'Search for partner',
              // contentPadding: EdgeInsets.only(bottom: 1.h, top: 6.h),
              hintStyle: AppTypography.avacadoRegular.copyWith(fontSize: 14.sp, textBaseline: TextBaseline.alphabetic),
              border: InputBorder.none,
            ),
          ),
        ),
        SizedBox(height: 10.0.h),
      ],
    );
  }

  Row _menuButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: () {
            AppHelper.showCustomSnackBar(context, "Logging Out", AppColors.primaryColor);
            context.read<AuthBloc>().add(LogOutEvent());
          },
          child: Icon(
            Icons.menu,
            color: Colors.black,
            size: 35.h,
          ),
        ),
      ],
    );
  }

  Row _appLogo() {
    return Row(
      children: [
        Image.asset(
          AppImages.logo, // Replace with your logo path
          width: 28.0.w,
          color: AppColors.primaryColor,
        ),
        SizedBox(
          width: 3.w,
        ),
        Text(
          "Applogo",
          style: AppTypography.avacadoExtraBold.copyWith(color: AppColors.primaryColor, fontStyle: FontStyle.italic),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_test/src/presentation/core/constants/app_colors.dart';
import 'package:machine_test/src/presentation/core/constants/app_typography.dart';
import 'package:machine_test/src/presentation/profile/widgets/appbar_button.dart';
import 'package:machine_test/src/presentation/profile/widgets/custom_chip.dart';
import 'package:machine_test/src/presentation/profile/widgets/image_slider.dart';
import 'package:machine_test/src/presentation/profile/widgets/profile_intrest_button.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SkeltonProfile extends StatelessWidget {
  const SkeltonProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final hobbiesAndInterests = ["sdasdas", "sdasdsad", "asdasdsd"];
    return Skeletonizer(
      ignoreContainers: true,
      effect: const ShimmerEffect(baseColor: Color(0xFFF1F1F1)),
      enabled: true,
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            surfaceTintColor: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.1),
            leadingWidth: ScreenUtil().screenWidth,
            toolbarHeight: 80.h,
            expandedHeight: 400.h,
            collapsedHeight: 80.h,
            stretch: false,
            snap: false,
            floating: false,
            pinned: true,
            leading: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppBarButton(
                    ontap: () {
                      Navigator.pop(context);
                    },
                    icon: Icons.arrow_back_ios_new_outlined,
                  ),
                  AppBarButton(
                    ontap: () {},
                    icon: Icons.star,
                  )
                ],
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              background: SizedBox(
                height: 400.h,
                child: Stack(
                  children: [
                    ImageSlider(imageList: const [""]),
                    Positioned(
                      bottom: 1.h,
                      left: ScreenUtil().screenWidth - 197.w,
                      right: 16.w,
                      child: const ProfileIntrestButton(),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Abhilash P",
                        style: AppTypography.avacadoMedium.copyWith(fontSize: 20.sp),
                      ),
                      Text(
                        "Software Engineer",
                        style: AppTypography.avacadoRegular.copyWith(fontSize: 14.sp, color: AppColors.grey),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "About",
                        style: AppTypography.avacadoBold.copyWith(color: AppColors.grey, fontSize: 16.sp),
                      ),
                      Container(
                        height: 2.h,
                        width: 40.w,
                        color: AppColors.primaryColor,
                      ),
                      Text(
                        "asjdkajskdjaskdjkasjdjklajsdajskdjaskdjaksjdkasjdkasjdkajsksdasdasdas damsd mas dkas dka sdka skd askd aks dka sdka sdk askd aks dkas k",
                        style: AppTypography.avacadoRegular.copyWith(color: AppColors.grey, height: 1.6.sp),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 16.0.h, bottom: 10.h),
                        child: Text(
                          "Hobbies and Interests",
                          style: AppTypography.avacadoBold.copyWith(color: AppColors.grey, fontSize: 16.sp),
                        ),
                      ),
                      Wrap(
                        direction: Axis.horizontal,
                        spacing: 10.w, // Horizontal spacing between items
                        runSpacing: 10.h, // Vertical spacing between rows
                        children: hobbiesAndInterests
                            .map(
                              (hobbie) => CustomChip(
                                text: hobbie,
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

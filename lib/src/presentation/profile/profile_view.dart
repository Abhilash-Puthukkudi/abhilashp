import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_test/src/application/auth/auth_bloc.dart';
import 'package:machine_test/src/application/core/status.dart';
import 'package:machine_test/src/application/home/home_bloc.dart';
import 'package:machine_test/src/domain/core/models/response_models/all_matches_model_with_copy_with/interest_status.dart';
import 'package:machine_test/src/presentation/core/constants/app_colors.dart';
import 'package:machine_test/src/presentation/core/constants/app_helper.dart';
import 'package:machine_test/src/presentation/core/constants/app_typography.dart';
import 'package:machine_test/src/presentation/profile/widgets/appbar_button.dart';
import 'package:machine_test/src/presentation/profile/widgets/custom_chip.dart';
import 'package:machine_test/src/presentation/profile/widgets/image_slider.dart';
import 'package:machine_test/src/presentation/profile/widgets/profile_intrest_button.dart';
import 'package:machine_test/src/presentation/profile/widgets/skelton_for_profile.dart';
import 'package:machine_test/src/presentation/view/home/widgets/sent_reject_button.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});

  final hobbiesAndInterests = [
    "Painting",
    "Photography",
    "Cycling",
    "Swimming",
    "Hiking",
    "Gardening",
    "Cooking",
    "Writing",
    "Dancing",
  ];

  @override
  Widget build(BuildContext context) {
    List<String> imageList = [""];
    return BlocListener<HomeBloc, HomeState>(
      listenWhen: (previous, current) => previous.loadProfileStatus != current.loadProfileStatus,
      listener: (context, state) {
        if (state.loadProfileStatus is StatusFailure) {
          final status = state.loadProfileStatus as StatusFailure;
          AppHelper.showCustomSnackBar(context, status.errorMessage, Colors.red);
          Navigator.pop(context);
        }
      },
      child: SizedBox(
        width: ScreenUtil().screenWidth,
        height: ScreenUtil().screenHeight,
        child: Scaffold(
          body: BlocBuilder<HomeBloc, HomeState>(
            buildWhen: (previous, current) => previous.loadProfileStatus != current.loadProfileStatus,
            builder: (context, state) {
              imageList = [
                "https://xsgames.co/randomusers/assets/avatars/${state.profileData.gender.toString()}/1.jpg",
                "https://xsgames.co/randomusers/assets/avatars/${state.profileData.gender.toString()}/2.jpg",
                "https://xsgames.co/randomusers/assets/avatars/${state.profileData.gender.toString()}/3.jpg",
                "https://xsgames.co/randomusers/assets/avatars/${state.profileData.gender.toString()}/4.jpg",
              ];
              if (state.loadProfileStatus is StatusLoading) {
                return const SkeltonProfile();
              }
              if (state.loadProfileStatus is StatusSuccess) {
                return CustomScrollView(
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
                            BlocBuilder<HomeBloc, HomeState>(
                              buildWhen: (previous, current) => previous.refreshShortListItem != current.refreshShortListItem,
                              builder: (context, state) {
                                return AppBarButton(
                                  ontap: () {
                                    if ((state.profileData.shortListed ?? false)) {
                                      context.read<HomeBloc>().add(ShortListEvent(profileId: state.profileData.id.toString(), create: "0"));
                                    } else {
                                      context.read<HomeBloc>().add(ShortListEvent(profileId: state.profileData.id.toString(), create: "1"));
                                    }
                                  },
                                  icon: Icons.star,
                                  color: (state.profileData.shortListed ?? false) ? AppColors.goldenColor : AppColors.white,
                                );
                              },
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
                              ImageSlider(imageList: imageList),
                              Positioned(
                                bottom: -1.h,
                                left: ScreenUtil().screenWidth - 197.w,
                                right: 16.w,
                                child: BlocBuilder<HomeBloc, HomeState>(
                                  buildWhen: (previous, current) => previous.intrestStatus != current.intrestStatus,
                                  builder: (context, state) {
                                    if (state.profileData.interestStatus == const InterestStatus()) {
                                      return ProfileIntrestButton(
                                        ontap: () {
                                          context.read<HomeBloc>().add(CreateIntrestEvent(reciverId: state.profileData.id.toString(), senderID: context.read<AuthBloc>().state.loginModel.customerId.toString()));
                                        },
                                        color: AppColors.primaryColor,
                                        text: "Sent Intrest",
                                      );
                                    } else if (state.profileData.interestStatus!.interestStatus == 'pending') {
                                      if (state.profileData.interestStatus!.sender.toString() == context.read<AuthBloc>().state.loginModel.customerId.toString()) {
                                        return ProfileIntrestButton(
                                          ontap: () {
                                            context.read<HomeBloc>().add(CreateIntrestEvent(reciverId: state.profileData.id.toString(), senderID: context.read<AuthBloc>().state.loginModel.customerId.toString()));
                                          },
                                          color: Colors.green,
                                          text: "Intrest Sent",
                                        );
                                      } else {
                                        return SentRejectButton(
                                          onAcceptPressed: () {
                                            context.read<HomeBloc>().add(AcceptRejectIntrestEvent(status: 'accepted', senderID: state.profileData.interestStatus!.sender.toString(), currentUserID: context.read<AuthBloc>().state.loginModel.customerId.toString()));
                                          },
                                          onRejectPressed: () {},
                                        );
                                      }
                                    } else if (state.profileData.interestStatus!.interestStatus.toString() == 'accepted') {
                                      return ProfileIntrestButton(
                                        color: Colors.greenAccent,
                                        text: "Chat",
                                        ontap: () {
                                          if (state.profileData.interestStatus!.sender.toString() == context.read<AuthBloc>().state.loginModel.customerId.toString()) {
                                            context.read<HomeBloc>().add(UndoIntrestEvent(recieverID: state.profileData.interestStatus!.reciever.toString()));
                                          } else {
                                            context.read<HomeBloc>().add(UndoIntrestEvent(recieverID: state.profileData.interestStatus!.sender.toString()));
                                          }
                                        },
                                      );
                                    } else if (state.profileData.interestStatus!.interestStatus.toString() == 'rejected') {
                                      return ProfileIntrestButton(
                                        color: Colors.red,
                                        text: "Rejected",
                                        ontap: () {
                                          if (state.profileData.interestStatus!.sender.toString() == context.read<AuthBloc>().state.loginModel.customerId.toString()) {
                                            context.read<HomeBloc>().add(UndoIntrestEvent(recieverID: state.profileData.interestStatus!.reciever.toString()));
                                          } else {
                                            context.read<HomeBloc>().add(UndoIntrestEvent(recieverID: state.profileData.interestStatus!.sender.toString()));
                                          }
                                        },
                                      );
                                    }
                                    return const SizedBox();
                                  },
                                ),
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
                                  "${state.profileData.user?.firstName ?? ""} ${state.profileData.user?.lastName ?? ""}",
                                  style: AppTypography.avacadoMedium.copyWith(fontSize: 20.sp),
                                ),
                                Text(
                                  "${state.profileData.occupation ?? "Software Engineer"}",
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
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt moll",
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
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }
}

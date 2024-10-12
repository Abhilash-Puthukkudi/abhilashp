import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_test/app/router/router_constants.dart';
import 'package:machine_test/src/application/auth/auth_bloc.dart';
import 'package:machine_test/src/application/core/status.dart';
import 'package:machine_test/src/application/home/home_bloc.dart';
import 'package:machine_test/src/domain/core/models/response_models/all_matches_model_with_copy_with/interest_status.dart';
import 'package:machine_test/src/presentation/core/constants/app_colors.dart';
import 'package:machine_test/src/presentation/core/constants/app_helper.dart';
import 'package:machine_test/src/presentation/core/constants/app_images.dart';
import 'package:machine_test/src/presentation/core/constants/app_typography.dart';
import 'package:machine_test/src/presentation/core/widgets/skelton_title.dart';
import 'package:machine_test/src/presentation/view/home/widgets/chat_button.dart';
import 'package:machine_test/src/presentation/view/home/widgets/interest_button.dart';
import 'package:machine_test/src/presentation/view/home/widgets/heading.dart';
import 'package:machine_test/src/presentation/view/home/widgets/rejected_button.dart';
import 'package:machine_test/src/presentation/view/home/widgets/sent_button.dart';
import 'package:machine_test/src/presentation/view/home/widgets/sent_reject_button.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AllMatchesList extends StatefulWidget {
  const AllMatchesList({
    super.key,
  });

  @override
  State<AllMatchesList> createState() => _AllMatchesListState();
}

class _AllMatchesListState extends State<AllMatchesList> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(LoadAllMatchesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listenWhen: (previous, current) => previous.shortListUserStatus != current.shortListUserStatus,
      listener: (context, state) {
        if (state.shortListUserStatus is StatusSuccess) {
          AppHelper.showCustomSnackBar(context, state.commonResponse.data.toString(), Colors.green);
        } else if (state.shortListUserStatus is StatusFailure) {
          final status = state.shortListUserStatus as StatusFailure;
          AppHelper.showCustomSnackBar(context, status.errorMessage, Colors.redAccent);
        }
      },
      child: BlocBuilder<HomeBloc, HomeState>(
        buildWhen: (previous, current) => previous.allMatchStatus != current.allMatchStatus,
        builder: (context, state) {
          if (state.allMatchStatus is StatusLoading) {
            return const SkeltonziedTile();
          } else if (state.allMatchStatus is StatusSuccess) {
            if (state.allMatchList.isEmpty) {
              return const SizedBox();
            }
            return SizedBox(
              height: 266.h,
              child: Column(
                children: [
                  Heading(heading: "All Matches", seeAllButtonTap: () {}),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(decelerationRate: ScrollDecelerationRate.fast),
                      scrollDirection: Axis.horizontal,
                      itemCount: state.allMatchList.length,
                      itemBuilder: (context, index) {
                        return Container(
                            decoration: BoxDecoration(
                              borderRadius: index == 0 ? const BorderRadius.only(topLeft: Radius.circular(12)) : null,
                            ),
                            margin: EdgeInsets.only(left: index == 0 ? 16.w : 0, right: 9.w),
                            width: 140.w,
                            height: 200.h,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch, // Ensures full width usage
                              children: [
                                InkWell(
                                  onTap: () {
                                    context.read<HomeBloc>().add(LoadProfileEvent(profileId: state.allMatchList[index].id.toString()));
                                    Navigator.pushNamed(context, RouterConstants.profileRoute);
                                  },
                                  child: SizedBox(
                                    height: 180.h,
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        SizedBox(
                                          height: 170.h,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.only(topLeft: Radius.circular(index == 0 ? 12 : 0)),
                                            child: CachedNetworkImage(
                                              imageUrl: "",
                                              fit: BoxFit.cover, // Fills the space and removes gaps
                                              placeholder: (context, url) => Skeleton.ignore(
                                                child: Skeletonizer(
                                                  enabled: true,
                                                  child: Image.asset(
                                                    AppImages.placeholder,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              errorWidget: (context, url, error) => Image.asset(
                                                AppImages.placeholder,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned.fill(
                                            child: Container(
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(begin: Alignment.bottomCenter, end: Alignment.topCenter, colors: [
                                            Colors.black.withOpacity(0.8), // Black at the bottom
                                            Colors.grey.withOpacity(0.4), // Slight grey in the middle
                                            Colors.transparent,
                                          ])),
                                          padding: EdgeInsets.only(left: 8.w, bottom: 2.h, top: 15.h, right: 8.w),
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  Container(
                                                    width: 20.w,
                                                    height: 24.h,
                                                    decoration: const BoxDecoration(color: AppColors.grey, borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5))),
                                                    child: InkWell(
                                                      onTap: () {
                                                        if ((state.allMatchList[index].shortListed ?? false)) {
                                                          context.read<HomeBloc>().add(ShortListEvent(
                                                                profileId: state.allMatchList[index].id.toString(),
                                                                create: "0",
                                                              ));
                                                        } else {
                                                          context.read<HomeBloc>().add(ShortListEvent(
                                                                profileId: state.allMatchList[index].id.toString(),
                                                                create: "1",
                                                              ));
                                                        }
                                                      },
                                                      child: BlocBuilder<HomeBloc, HomeState>(
                                                        buildWhen: (previous, current) => previous.refreshShortListItem != current.refreshShortListItem,
                                                        builder: (context, state) {
                                                          return Icon(
                                                            Icons.star,
                                                            color: (state.allMatchList[index].shortListed ?? false) ? AppColors.goldenColor : AppColors.white,
                                                            size: 15.h,
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Expanded(
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisSize: MainAxisSize.max,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      crossAxisAlignment: CrossAxisAlignment.end,
                                                      children: [
                                                        rawFlexible(
                                                          Text(
                                                            "${state.allMatchList[index].user?.firstName ?? ""} ${state.allMatchList[index].user?.lastName ?? ""}",
                                                            maxLines: 1,
                                                            style: AppTypography.avacadoMedium.copyWith(color: AppColors.white),
                                                          ),
                                                        ),
                                                        const SizedBox(width: 2), // Adjust the width to control the distance
                                                        (state.allMatchList[index].isVerified ?? false)
                                                            ? Icon(
                                                                Icons.verified,
                                                                color: AppColors.verifiedColor,
                                                                size: 17.h,
                                                              )
                                                            : SizedBox(width: 18.w),
                                                      ],
                                                    ),
                                                    rawFlexible(Text("${AppHelper.calculateAge(state.allMatchList[index].dob.toString())}, ${AppHelper.convertCmToFeet(state.allMatchList[index].height.toString())}", maxLines: 1, style: AppTypography.avacadoMedium.copyWith(color: AppColors.white))),
                                                    rawFlexible(Text(state.allMatchList[index].address ?? "", maxLines: 1, style: AppTypography.avacadoMedium.copyWith(color: AppColors.white))),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ))
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                BlocBuilder<HomeBloc, HomeState>(
                                  buildWhen: (previous, current) => previous.intrestStatus != current.intrestStatus,
                                  builder: (context, state) {
                                    if (state.allMatchList[index].interestStatus == const InterestStatus()) {
                                      return IntrestButton(
                                        onPressed: () {
                                          context.read<HomeBloc>().add(CreateIntrestEvent(reciverId: state.allMatchList[index].id.toString(), senderID: context.read<AuthBloc>().state.loginModel.customerId.toString()));
                                        },
                                      );
                                    }
                                    if (state.allMatchList[index].interestStatus!.interestStatus.toString() == 'pending' && state.allMatchList[index].interestStatus!.sender.toString() == context.read<AuthBloc>().state.loginModel.customerId.toString()) {
                                      return SentButton(onPressed: () {});
                                    }
                                    if (state.allMatchList[index].interestStatus!.interestStatus.toString() == 'pending' && state.allMatchList[index].interestStatus!.sender.toString() != context.read<AuthBloc>().state.loginModel.customerId.toString()) {
                                      return SentRejectButton(
                                        onAcceptPressed: () {
                                          context.read<HomeBloc>().add(AcceptRejectIntrestEvent(status: 'accepted', senderID: state.allMatchList[index].interestStatus!.sender.toString(), currentUserID: context.read<AuthBloc>().state.loginModel.customerId.toString()));
                                        },
                                        onRejectPressed: () {
                                          context.read<HomeBloc>().add(AcceptRejectIntrestEvent(status: 'rejected', senderID: state.allMatchList[index].interestStatus!.sender.toString(), currentUserID: context.read<AuthBloc>().state.loginModel.customerId.toString()));
                                        },
                                      );
                                    }
                                    if (state.allMatchList[index].interestStatus!.interestStatus.toString() == 'accepted') {
                                      return ChatButton(onPressed: () {
                                        if (state.allMatchList[index].interestStatus!.sender.toString() != context.read<AuthBloc>().state.loginModel.customerId.toString()) {
                                          context.read<HomeBloc>().add(UndoIntrestEvent(recieverID: state.allMatchList[index].interestStatus!.sender.toString()));
                                        } else {
                                          context.read<HomeBloc>().add(UndoIntrestEvent(recieverID: state.allMatchList[index].interestStatus!.reciever.toString()));
                                        }
                                      });
                                    }
                                    if (state.allMatchList[index].interestStatus!.interestStatus.toString() == 'rejected') {
                                      return RejectedButton(onPressed: () {
                                        if (state.allMatchList[index].interestStatus!.sender.toString() != context.read<AuthBloc>().state.loginModel.customerId.toString()) {
                                          context.read<HomeBloc>().add(UndoIntrestEvent(recieverID: state.allMatchList[index].interestStatus!.sender.toString()));
                                        } else {
                                          context.read<HomeBloc>().add(UndoIntrestEvent(recieverID: state.allMatchList[index].interestStatus!.reciever.toString()));
                                        }
                                      });
                                    }
                                    return const SizedBox();
                                  },
                                ),
                              ],
                            ));
                      },
                    ),
                  )
                ],
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget rawFlexible(Widget child) {
    return Flexible(child: child); // Use Flexible instead of Expanded
  }
}

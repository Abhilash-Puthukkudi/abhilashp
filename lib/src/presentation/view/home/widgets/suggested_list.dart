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

class SuggesionsList extends StatefulWidget {
  const SuggesionsList({
    super.key,
  });

  @override
  State<SuggesionsList> createState() => _SuggesionsListState();
}

class _SuggesionsListState extends State<SuggesionsList> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(LoadAllSugetionsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) => previous.sugesstionsListStatus != current.sugesstionsListStatus,
      builder: (context, state) {
        if (state.sugesstionsListStatus is StatusLoading) {
          return const SkeltonziedTile();
        } else if (state.sugesstionsListStatus is StatusSuccess) {
          return SizedBox(
            height: 310.h,
            child: Column(
              children: [
                Heading(heading: "Suggested Posts", seeAllButtonTap: () {}),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(decelerationRate: ScrollDecelerationRate.fast),
                    scrollDirection: Axis.horizontal,
                    itemCount: state.sugesstionsList.length,
                    itemBuilder: (context, index) {
                      if (state.sugesstionsList.isEmpty) {
                        return const SizedBox();
                      }
                      return Container(
                          decoration: BoxDecoration(
                            borderRadius: index == 0 ? const BorderRadius.only(topLeft: Radius.circular(12)) : null,
                          ),
                          margin: EdgeInsets.only(left: index == 0 ? 16.w : 0, right: 9.w),
                          width: 140.w,
                          height: 260.h,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch, // Ensures full width usage
                            children: [
                              InkWell(
                                onTap: () {
                                  context.read<HomeBloc>().add(LoadProfileEvent(profileId: state.sugesstionsList[index].id.toString()));
                                  Navigator.pushNamed(context, RouterConstants.profileRoute);
                                },
                                child: SizedBox(
                                  height: 240.h,
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      SizedBox(
                                        height: 280.h,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.only(topLeft: Radius.circular(index == 0 ? 12 : 0)),
                                          child: CachedNetworkImage(
                                            imageUrl: "https://xsgames.co/randomusers/assets/avatars/${state.sugesstionsList[index].gender.toString()}/$index.jpg",
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
                                        padding: EdgeInsets.only(left: 8.w, bottom: 10.h, top: 15.h, right: 8.w),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                BlocBuilder<HomeBloc, HomeState>(
                                                  buildWhen: (previous, current) => previous.refreshShortListItem != current.refreshShortListItem,
                                                  builder: (context, state) {
                                                    return InkWell(
                                                      onTap: () {
                                                        if ((state.sugesstionsList[index].shortListed ?? false)) {
                                                          context.read<HomeBloc>().add(ShortListEvent(
                                                                profileId: state.sugesstionsList[index].id.toString(),
                                                                create: "0",
                                                              ));
                                                        } else {
                                                          context.read<HomeBloc>().add(ShortListEvent(
                                                                profileId: state.sugesstionsList[index].id.toString(),
                                                                create: "1",
                                                              ));
                                                        }
                                                      },
                                                      child: Container(
                                                        width: 20.w,
                                                        height: 24.h,
                                                        decoration: const BoxDecoration(color: AppColors.grey, borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5))),
                                                        child: Icon(
                                                          Icons.star,
                                                          color: (state.sugesstionsList[index].shortListed ?? false) ? AppColors.goldenColor : AppColors.white,
                                                          size: 15.h,
                                                        ),
                                                      ),
                                                    );
                                                  },
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
                                                          "${state.sugesstionsList[index].user?.firstName ?? ""} ${state.sugesstionsList[index].user?.lastName ?? ""}",
                                                          maxLines: 1,
                                                          overflow: TextOverflow.clip,
                                                          style: AppTypography.avacadoMedium.copyWith(color: AppColors.white),
                                                        ),
                                                      ),
                                                      const SizedBox(width: 2), // Adjust the width to control the distance
                                                      (state.sugesstionsList[index].isVerified ?? false)
                                                          ? Icon(
                                                              Icons.verified,
                                                              color: AppColors.verifiedColor,
                                                              size: 17.h,
                                                            )
                                                          : SizedBox(
                                                              width: 17.w,
                                                            ),
                                                    ],
                                                  ),
                                                  rawFlexible(
                                                      Text("${AppHelper.calculateAge(state.sugesstionsList[index].dob.toString())}, ${AppHelper.convertCmToFeet(state.sugesstionsList[index].height.toString())}", maxLines: 1, style: AppTypography.avacadoMedium.copyWith(color: AppColors.white))),
                                                  rawFlexible(Text(state.sugesstionsList[index].address ?? "", maxLines: 1, style: AppTypography.avacadoMedium.copyWith(color: AppColors.white))),
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
                                  if (state.sugesstionsList[index].interestStatus == const InterestStatus()) {
                                    return IntrestButton(
                                      onPressed: () {
                                        context.read<HomeBloc>().add(CreateIntrestEvent(reciverId: state.sugesstionsList[index].id.toString(), senderID: context.read<AuthBloc>().state.loginModel.customerId.toString()));
                                      },
                                    );
                                  }
                                  if (state.sugesstionsList[index].interestStatus!.interestStatus.toString() == 'pending' && state.sugesstionsList[index].interestStatus!.sender.toString() == context.read<AuthBloc>().state.loginModel.customerId.toString()) {
                                    return SentButton(onPressed: () {});
                                  }
                                  if (state.sugesstionsList[index].interestStatus!.interestStatus.toString() == 'pending' && state.sugesstionsList[index].interestStatus!.sender.toString() != context.read<AuthBloc>().state.loginModel.customerId.toString()) {
                                    return SentRejectButton(
                                      onAcceptPressed: () {
                                        context.read<HomeBloc>().add(AcceptRejectIntrestEvent(status: 'accepted', senderID: state.sugesstionsList[index].interestStatus!.sender.toString(), currentUserID: context.read<AuthBloc>().state.loginModel.customerId.toString()));
                                      },
                                      onRejectPressed: () {
                                        context.read<HomeBloc>().add(AcceptRejectIntrestEvent(status: 'rejected', senderID: state.sugesstionsList[index].interestStatus!.sender.toString(), currentUserID: context.read<AuthBloc>().state.loginModel.customerId.toString()));
                                      },
                                    );
                                  }
                                  if (state.sugesstionsList[index].interestStatus!.interestStatus.toString() == 'accepted') {
                                    return ChatButton(onPressed: () {
                                      if (state.sugesstionsList[index].interestStatus!.sender.toString() != context.read<AuthBloc>().state.loginModel.customerId.toString()) {
                                        context.read<HomeBloc>().add(UndoIntrestEvent(recieverID: state.sugesstionsList[index].interestStatus!.sender.toString()));
                                      } else {
                                        context.read<HomeBloc>().add(UndoIntrestEvent(recieverID: state.sugesstionsList[index].interestStatus!.reciever.toString()));
                                      }
                                    });
                                  }
                                  if (state.sugesstionsList[index].interestStatus!.interestStatus.toString() == 'rejected') {
                                    return RejectedButton(onPressed: () {
                                      if (state.sugesstionsList[index].interestStatus!.sender.toString() != context.read<AuthBloc>().state.loginModel.customerId.toString()) {
                                        context.read<HomeBloc>().add(UndoIntrestEvent(recieverID: state.sugesstionsList[index].interestStatus!.sender.toString()));
                                      } else {
                                        context.read<HomeBloc>().add(UndoIntrestEvent(recieverID: state.sugesstionsList[index].interestStatus!.reciever.toString()));
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
    );
  }

  Widget rawFlexible(Widget child) {
    return Flexible(child: child); // Use Flexible instead of Expanded
  }
}

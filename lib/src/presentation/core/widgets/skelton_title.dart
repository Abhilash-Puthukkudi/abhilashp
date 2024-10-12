import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_test/src/presentation/core/constants/app_colors.dart';
import 'package:machine_test/src/presentation/core/constants/app_typography.dart';
import 'package:machine_test/src/presentation/view/home/widgets/heading.dart';
import 'package:machine_test/src/presentation/view/home/widgets/interest_button.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SkeltonziedTile extends StatelessWidget {
  const SkeltonziedTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      ignoreContainers: true,
      effect: const ShimmerEffect(baseColor: Color(0xFFF1F1F1)),
      enabled: true,
      child: SizedBox(
        height: 266.h,
        child: Column(
          children: [
            Heading(heading: "All Matches", seeAllButtonTap: () {}),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(
                    decelerationRate: ScrollDecelerationRate.fast),
                scrollDirection: Axis.horizontal,
                itemCount: 33,
                itemBuilder: (context, index) {
                  return Container(
                      decoration: BoxDecoration(
                        borderRadius: index == 0
                            ? const BorderRadius.only(
                                topLeft: Radius.circular(12))
                            : null,
                      ),
                      margin: EdgeInsets.only(
                          left: index == 0 ? 16.w : 0, right: 9.w),
                      width: 140.w,
                      height: 200.h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment
                            .stretch, // Ensures full width usage
                        children: [
                          SizedBox(
                            height: 180.h,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                SizedBox(
                                  height: 170.h,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(
                                              index == 0 ? 12 : 0)),
                                      child: Container()),
                                ),
                                Positioned.fill(
                                    child: Container(
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter,
                                          colors: [
                                        Colors.black.withOpacity(
                                            0.8), // Black at the bottom
                                        Colors.grey.withOpacity(
                                            0.4), // Slight grey in the middle
                                        Colors.transparent,
                                      ])),
                                  padding: EdgeInsets.only(
                                      left: 0.w,
                                      bottom: 10.h,
                                      top: 15.h,
                                      right: 8.w),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            child: Icon(
                                              Icons.star,
                                              color: AppColors.goldenColor,
                                              size: 15.h,
                                            ),
                                            width: 20.w,
                                            height: 24.h,
                                            decoration: const BoxDecoration(
                                                color: AppColors.grey,
                                                borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(5),
                                                    topRight:
                                                        Radius.circular(5))),
                                          )
                                        ],
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  "Abhilash P",
                                                  maxLines: 1,
                                                  style: AppTypography
                                                      .avacadoMedium
                                                      .copyWith(
                                                          color:
                                                              AppColors.white),
                                                ),

                                                const SizedBox(
                                                    width:
                                                        2), // Adjust the width to control the distance
                                                Icon(
                                                  Icons.verified,
                                                  color:
                                                      AppColors.verifiedColor,
                                                  size: 17.h,
                                                ),
                                              ],
                                            ),
                                            Text("24yrs,5'5",
                                                maxLines: 1,
                                                style: AppTypography
                                                    .avacadoMedium
                                                    .copyWith(
                                                        color:
                                                            AppColors.white)),
                                            Text("Kozhikode, Kerala",
                                                maxLines: 1,
                                                style: AppTypography
                                                    .avacadoMedium
                                                    .copyWith(
                                                        color: AppColors.white))
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ))
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          IntrestButton(
                            onPressed: () {},
                          ),
                        ],
                      ));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_test/src/presentation/core/constants/app_images.dart';
import 'package:machine_test/src/presentation/profile/widgets/page_indicator.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ImageSlider extends StatelessWidget {
  final List<String> imageList;
  ImageSlider({
    super.key,
    required this.imageList,
  });
  final ValueNotifier<int> _currentImgeIndex = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 420.h,
      child: Stack(
        children: [
          PageView.builder(
            itemCount: imageList.length,
            onPageChanged: (int index) {
              _currentImgeIndex.value = index;
            },
            itemBuilder: (context, index) {
              return Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    child: CachedNetworkImage(
                      imageUrl: imageList[index],
                      fit: BoxFit.cover, // Fills the space and removes gaps
                      placeholder: (context, url) => Skeleton.ignore(
                        child: Skeleton.ignore(
                          child: Skeletonizer(
                            enabled: true,
                            child: Image.asset(
                              AppImages.placeholder,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) => Image.asset(
                        AppImages.placeholder,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned.fill(
                      child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(begin: Alignment.bottomCenter, end: Alignment.topCenter, colors: [
                      Colors.black.withOpacity(0.8), // Black at the bottom
                      Colors.grey.withOpacity(0.3), // Slight grey in the middle
                      Colors.transparent,
                    ])),
                  )),
                ],
              );
            },
          ),
          Positioned(
              bottom: 25.h,
              left: 16.w,
              right: 0,
              child: ValueListenableBuilder(
                  valueListenable: _currentImgeIndex,
                  builder: (context, value, child) {
                    return PageIndicator(
                      length: imageList.length,
                      currentIndex: value,
                    );
                  }))
        ],
      ),
    );
  }
}

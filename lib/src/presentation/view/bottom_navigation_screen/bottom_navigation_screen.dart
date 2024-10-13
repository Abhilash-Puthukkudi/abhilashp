import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_test/src/presentation/core/constants/app_colors.dart';
import 'package:machine_test/src/presentation/core/constants/app_helper.dart';
import 'package:machine_test/src/presentation/core/constants/app_images.dart';
import 'package:machine_test/src/presentation/view/home/home_view.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key, this.selectedIndex = 0});
  final int selectedIndex;
  @override
  State<BottomNavigationScreen> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavigationScreen> {
  final PageStorageBucket bucket = PageStorageBucket();
  List<String> bottomNavIcons = [
    AppImages.home,
    AppImages.like,
    AppImages.chat,
    AppImages.profile,
  ];

  final selectedIndex = ValueNotifier(0);
  late List<Widget> screens;
  @override
  void initState() {
    super.initState();
    screens = [
      const HomeView(),
      const Center(
        child: Text("Fav Screen"),
      ),
      const Center(
        child: Text("Chat Screen"),
      ),
      const Center(
        child: Text("Profile Screen"),
      ),
    ];
    selectedIndex.value = widget.selectedIndex;
  }

  DateTime? _lastPressed;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      // ignore: deprecated_member_use
      onPopInvoked: (bool isPop) {
        if (selectedIndex.value != 0) {
          selectedIndex.value = 0;
          return;
        }
        if (_lastPressed == null || DateTime.now().difference(_lastPressed!) > const Duration(seconds: 2)) {
          _lastPressed = DateTime.now();
          AppHelper.showCustomSnackBar(context, 'Press back again to exit', AppColors.primaryColor);
          return;
        } else {
          SystemNavigator.pop();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        extendBody: true,
        bottomNavigationBar: bottomNavBar(),
        body: SizedBox(
          width: ScreenUtil().screenWidth,
          height: ScreenUtil().screenHeight,
          child: ValueListenableBuilder(
            valueListenable: selectedIndex,
            builder: (BuildContext context, int value, Widget? child) {
              return PageStorage(
                // key: _pageStorageKeys[selectedIndex.value],
                bucket: bucket,
                child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 600),
                    transitionBuilder: (child, animation) {
                      final begin = Offset(selectedIndex.value < value ? 0 : 0, 1);
                      const end = Offset(0.0, 0.0);
                      final curveTween = CurveTween(curve: Curves.ease);
                      final tween = Tween(begin: begin, end: end).chain(curveTween);
                      return SlideTransition(
                        position: animation.drive(tween),
                        child: child,
                      );
                    },
                    child: screens[selectedIndex.value]),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget bottomNavBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.0.w),
      child: Container(
        height: 100.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(40.r), topRight: Radius.circular(40.r)),
          color: Theme.of(context).scaffoldBackgroundColor,
          boxShadow: [
            BoxShadow(
              blurRadius: 20.r,
              spreadRadius: 0,
              color: AppColors.black.withOpacity(0.2),
              offset: const Offset(0, -20),
            ),
          ],
        ),
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 23.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            bottomNavIcons.length,
            (index) => InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                selectedIndex.value = index;
              },
              child: ValueListenableBuilder(
                valueListenable: selectedIndex,
                builder: (BuildContext context, int value, Widget? child) {
                  return AnimatedSwitcher(
                      duration: const Duration(microseconds: 100),
                      transitionBuilder: (child, animation) => ScaleTransition(
                            scale: animation,
                            child: child,
                          ),
                      child: selectedIndex.value != index
                          ? Container(
                              width: 50.w,
                              height: 60.h,
                              padding: EdgeInsets.all(12.r),
                              child: Image.asset(
                                bottomNavIcons[index],
                                color: selectedIndex.value == index ? AppColors.white : AppColors.black,
                              ),
                            )
                          : Container(
                              width: 50.w,
                              height: 50.h,
                              padding: EdgeInsets.all(12.r),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(23),
                                // shape: BoxShape.circle,
                                color: AppColors.primaryColor,
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    AppColors.primaryColor.withOpacity(0.68),
                                    AppColors.primaryColor.withOpacity(0.9),
                                    AppColors.primaryColor,
                                    AppColors.primaryColor,
                                  ],
                                ),
                                boxShadow: [
                                  const BoxShadow(
                                    color: Colors.black,
                                  ),
                                  BoxShadow(
                                    color: Colors.black54,
                                    spreadRadius: -5.0,
                                    blurRadius: 0.0.r,
                                  ),
                                ],
                              ),
                              child: Image.asset(
                                bottomNavIcons[index],
                                color: selectedIndex.value == index ? AppColors.white : AppColors.black,
                              ),
                            ));
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

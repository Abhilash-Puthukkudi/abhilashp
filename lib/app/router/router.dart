// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:machine_test/app/router/router_constants.dart';
import 'package:machine_test/src/presentation/view/auth/login_screen.dart';
import 'package:machine_test/src/presentation/view/bottom_navigation_screen/bottom_navigation_screen.dart';
import 'package:machine_test/src/presentation/profile/profile_view.dart';

enum PageRouteAnimation { fade, scale, rotate, slide, slideBottomTop }

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouterConstants.homeRoute:
        return buildPageRoute(
            const BottomNavigationScreen(), PageRouteAnimation.slide);

      case RouterConstants.loginRoute:
        return buildPageRoute(SignInScreen(), PageRouteAnimation.slide);

      case RouterConstants.profileRoute:
        return buildPageRoute(ProfileView(), PageRouteAnimation.slide);

      // case RouterConstants.changePasswordOTPScreenRoute:
      //   final argsList = settings.arguments as List;
      //   return buildPageRoute(
      //       ChangePasswordOTPView(
      //         phoneNumber: argsList[0],
      //         password: argsList[1],
      //       ),
      //       PageRouteAnimation.Slide);

      // case RouterConstants.splashRoute:
      //   return MaterialPageRoute<SplashView>(
      //     builder: (_) => const SplashView(),
      //   );

      default:
        return MaterialPageRoute<Scaffold>(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }

  static Route<T> buildPageRoute<T>(
    Widget? child,
    PageRouteAnimation? pageRouteAnimation,
  ) {
    if (pageRouteAnimation != null) {
      if (pageRouteAnimation == PageRouteAnimation.fade) {
        return PageRouteBuilder(
          pageBuilder: (c, a1, a2) => child!,
          transitionsBuilder: (c, anim, a2, child) =>
              FadeTransition(opacity: anim, child: child),
          transitionDuration: const Duration(milliseconds: 1000),
        );
      } else if (pageRouteAnimation == PageRouteAnimation.rotate) {
        return PageRouteBuilder(
          pageBuilder: (c, a1, a2) => child!,
          transitionsBuilder: (c, anim, a2, child) =>
              RotationTransition(child: child, turns: ReverseAnimation(anim)),
          transitionDuration: const Duration(milliseconds: 700),
        );
      } else if (pageRouteAnimation == PageRouteAnimation.scale) {
        return PageRouteBuilder(
          pageBuilder: (c, a1, a2) => child!,
          transitionsBuilder: (c, anim, a2, child) =>
              ScaleTransition(child: child, scale: anim),
          transitionDuration: const Duration(milliseconds: 700),
        );
      } else if (pageRouteAnimation == PageRouteAnimation.slide) {
        return PageRouteBuilder(
          pageBuilder: (c, a1, a2) => child!,
          transitionsBuilder: (c, anim, a2, child) => SlideTransition(
            child: child,
            position: Tween(
                    begin: const Offset(1.0, 0.0), end: const Offset(0.0, 0.0))
                .animate(anim),
          ),
          transitionDuration: const Duration(milliseconds: 350),
        );
      } else if (pageRouteAnimation == PageRouteAnimation.slideBottomTop) {
        return PageRouteBuilder(
          pageBuilder: (c, a1, a2) => child!,
          transitionsBuilder: (c, anim, a2, child) => SlideTransition(
            child: child,
            position: Tween(
                    begin: const Offset(0.0, 1.0), end: const Offset(0.0, 0.0))
                .animate(anim),
          ),
          transitionDuration: const Duration(milliseconds: 350),
        );
      }
    }
    return MaterialPageRoute<T>(builder: (_) => child!);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:machine_test/app/injector/injector.dart';
import 'package:machine_test/app/router/router.dart';
import 'package:machine_test/app/router/router_constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_test/src/application/auth/auth_bloc.dart';
import 'package:machine_test/src/application/home/home_bloc.dart';
import 'package:machine_test/src/presentation/core/constants/app_colors.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark));
    return ScreenUtilInit(
      designSize: const Size(390, 893),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => getIt<AuthBloc>()),
            BlocProvider(create: (context) => getIt<HomeBloc>()),
          ],
          child: MaterialApp(
            builder: (BuildContext context, Widget? child) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  textScaler: const TextScaler.linear(1),
                ),
                child: child!,
              );
            },
            theme: ThemeData(
              primaryColor: AppColors.primaryColor,
              appBarTheme: const AppBarTheme(color: Colors.transparent),
              useMaterial3: true,
              scaffoldBackgroundColor: AppColors.white,
            ),
            initialRoute: RouterConstants.loginRoute,
            onGenerateRoute: AppRouter.generateRoute,
            debugShowCheckedModeBanner: false,
          ),
        );
      },
    );
  }
}

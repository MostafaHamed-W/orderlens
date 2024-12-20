import 'package:flutter/material.dart';
import 'package:orderlens/core/routing/app_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orderlens/core/routing/navigation_service.dart';
import 'package:orderlens/core/routing/routes.dart';
import 'package:orderlens/core/theming/app_theme.dart';


class OrderLens extends StatelessWidget {
  final AppRouter appRouter;
  const OrderLens({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        themeMode: ThemeMode.dark,
        theme: AppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRouter.generateRoute,
        navigatorKey: NavigationService.navigationKey,
        initialRoute: Routes.onBoardingScreen,
      ),
    );
  }
}

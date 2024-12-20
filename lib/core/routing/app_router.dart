import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:orderlens/core/routing/routes.dart';
import 'package:orderlens/features/dashboard/ui/dashboard_screen.dart';
import 'package:orderlens/features/onboarding/ui/onboarding_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )

    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
          settings: settings,
        );
      case Routes.dashboardScreen:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => const DashboardScreen(),
          settings: settings,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeScaleTransition(
              animation: animation,
              child: child,
            );
          },
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}

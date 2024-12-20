import 'package:flutter/material.dart';
import 'package:orderlens/core/helpers/extensions.dart';
import 'package:orderlens/core/helpers/spacing.dart';
import 'package:orderlens/core/routing/routes.dart';
import 'package:orderlens/core/theming/colors_manager.dart';
import 'package:orderlens/core/theming/styles.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Text(
                'Onboarding Placeholder'.hardcoded,
                style: TextStyles.font28SemiBold,
              ),
            ),
          ),
          TextButton(
            onPressed: () => context.pushNamed(Routes.dashboardScreen),
            child: Text(
              'Get Started'.hardcoded,
              style: TextStyles.font18Regular.copyWith(color: ColorsManager.white),
            ),
          ),
          verticalHight(40),
        ],
      ),
    );
  }
}

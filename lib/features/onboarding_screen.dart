import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orderlens/core/helpers/extensions.dart';
import 'package:orderlens/core/helpers/spacing.dart';
import 'package:orderlens/core/routing/routes.dart';
import 'package:orderlens/core/helpers/assets_paths.dart';
import 'package:orderlens/core/theming/colors_manager.dart';
import 'package:orderlens/core/theming/styles.dart';
import 'package:orderlens/core/widgets/custom_text_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      verticalHight(20),
                      Text(
                        'Welcome to OrderLens'.hardcoded,
                        style: TextStyles.font22SemiBold,
                        textAlign: TextAlign.left,
                      ),
                      verticalHight(20),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: SvgPicture.asset(AssetsPaths.onBoarding),
                      ),
                      Text(
                        'Your Gateway to Smarter Metrics'.hardcoded,
                        style: TextStyles.font20SemiBold,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'Track orders, analyze trends, and optimize your business decisions. Simplify your workflow with smart insights.'.hardcoded,
                        style: TextStyles.font14Regular.copyWith(color: ColorsManager.lightGrey),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              CustomTextButton(buttonText: "Get Started".hardcoded, onPressed: () => context.pushNamed(Routes.dashboardScreen)),
              verticalHight(20),
            ],
          ),
        ),
      ),
    );
  }
}

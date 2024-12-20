import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orderlens/core/helpers/extensions.dart';
import 'package:orderlens/core/helpers/spacing.dart';
import 'package:orderlens/core/routing/routes.dart';
import 'package:orderlens/core/theming/app_images.dart';
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalHight(20),
                      Text(
                        'Welcome to OrderLens'.hardcoded,
                        style: TextStyles.font22SemiBold,
                        textAlign: TextAlign.left,
                      ),
                      verticalHight(20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: SvgPicture.asset(AppImages.onBoarding),
                      ),
                      Center(
                        child: Text(
                          'Your Gateway to Smarter Metrics'.hardcoded,
                          style: TextStyles.font20SemiBold,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Center(
                        child: Text(
                          'Track orders, analyze trends, and optimize your business decisions. Simplify your workflow with smart insights.'.hardcoded,
                          style: TextStyle(fontSize: 16, color: Colors.grey[400]),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              CustomTextButton(buttonText: "Get Started".hardcoded, onPressed: () => context.pushNamed(Routes.dashboardScreen)),
              verticalHight(10),
            ],
          ),
        ),
      ),
    );
  }
}

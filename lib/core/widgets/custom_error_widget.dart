import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orderlens/core/helpers/assets_paths.dart';
import 'package:orderlens/core/helpers/extensions.dart';
import 'package:orderlens/core/helpers/spacing.dart';
import 'package:orderlens/core/routing/routes.dart';

import 'package:orderlens/core/theming/colors_manager.dart';
import 'package:orderlens/core/theming/styles.dart';

import 'package:orderlens/core/widgets/custom_title_text.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errorMessage});
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          verticalHight(20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SvgPicture.asset(AssetsPaths.error),
          ),
          CustomTitleText(title: 'Error fetching data'.hardcoded),
          verticalHight(8),
          Text(
            '$errorMessage, Please try again later!',
            style: TextStyles.font14Regular.copyWith(color: ColorsManager.lightGrey),
          ),
          verticalHight(15),
          TextButton(
            onPressed: () => context.pushNamed(Routes.onBoardingScreen),
            child: Text(
              'Go Back',
              style: TextStyles.font14Meduim.copyWith(decoration: TextDecoration.underline),
            ),
          )
        ],
      ),
    );
  }
}

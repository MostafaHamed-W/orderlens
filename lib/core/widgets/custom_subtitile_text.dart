import 'package:flutter/material.dart';
import 'package:orderlens/core/theming/colors_manager.dart';
import 'package:orderlens/core/theming/styles.dart';

class CustomSubtitleText extends StatelessWidget {
  const CustomSubtitleText({
    super.key,
    this.alignEnd = false,
    required this.subTitle,
  });

  final String subTitle;
  final bool alignEnd;
  @override
  Widget build(BuildContext context) {
    return alignEnd
        ? Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                subTitle,
                style: TextStyles.font12Regular.copyWith(color: ColorsManager.lightGrey),
              )
            ],
          )
        : Text(
            subTitle,
            style: TextStyles.font12Regular.copyWith(color: ColorsManager.lightGrey),
          );
  }
}

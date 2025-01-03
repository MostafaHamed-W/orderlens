import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orderlens/core/theming/colors_manager.dart';
import 'package:orderlens/core/theming/styles.dart';

class CustomTextButton extends StatelessWidget {
  final double? borderRaius;
  final Color? backgroundColor;
  final double? horizentalPadding;
  final double? verticalPadding;
  final double? buttonWidth;
  final double? buttonHeight;
  final VoidCallback onPressed;
  final String buttonText;
  final TextStyle? buttonTextStyle;

  const CustomTextButton({
    super.key,
    this.borderRaius,
    this.backgroundColor,
    this.horizentalPadding,
    this.verticalPadding,
    this.buttonWidth,
    this.buttonHeight,
    this.buttonTextStyle,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRaius ?? 16.r),
          ),
        ),
        backgroundColor: WidgetStatePropertyAll(
          backgroundColor ?? ColorsManager.primaryBlue,
        ),
        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(
            vertical: verticalPadding?.h ?? 14.h,
            horizontal: horizentalPadding?.w ?? 12.w,
          ),
        ),
        fixedSize: WidgetStatePropertyAll(
          Size(
            buttonWidth?.w ?? double.maxFinite,
            buttonHeight?.h ?? 50.h,
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: buttonTextStyle ?? TextStyles.font16Regular,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:orderlens/core/theming/styles.dart';

class CustomTitleText extends StatelessWidget {
  final String title;
  const CustomTitleText({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(title, style: TextStyles.font18MeduimSemiBold);
  }
}

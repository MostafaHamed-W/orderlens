import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orderlens/core/theming/colors_manager.dart';
import 'package:orderlens/core/theming/styles.dart';

class OrderGraphDataComponent extends StatelessWidget {
  const OrderGraphDataComponent({
    super.key,
    required this.title,
    this.details,
    required this.icon,
    required this.value,
  });
  final String title, value;
  final String? details;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      width: 150.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: ColorsManager.strokeColor, width: 1),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 8.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title.toUpperCase(), style: TextStyles.font16Bold),
            Text(
              '$value order',
              style: TextStyles.font16Meduim.copyWith(color: ColorsManager.lightGrey),
            ),
          ],
        ),
      ),
    );
  }
}

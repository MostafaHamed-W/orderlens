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
      height: 80,
      width: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: ColorsManager.strokeColor, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title.toUpperCase(),
              style: TextStyles.font15Bold,
              overflow: TextOverflow.clip,
              maxLines: 1,
            ),
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

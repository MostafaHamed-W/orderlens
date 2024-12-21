import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orderlens/core/helpers/extensions.dart';
import 'package:orderlens/core/theming/colors_manager.dart';
import 'package:orderlens/core/theming/styles.dart';

class MetricCard extends StatelessWidget {
  const MetricCard({
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
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: ColorsManager.strokeColor, width: 1),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Icon(icon, size: 35, color: ColorsManager.white),
        title: Text(title, style: TextStyles.font16Meduim),
        subtitle: details.isNullOrEmpty() ? null : Text(details!, style: TextStyles.font12Regular.copyWith(color: ColorsManager.lightGrey)),
        trailing: Text(
          value,
          style: TextStyles.font16Meduim,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:orderlens/core/theming/colors_manager.dart';
import 'package:orderlens/core/theming/styles.dart';

class MetricCard extends StatelessWidget {
  const MetricCard({super.key, required this.title, required this.value, required this.icon});
  final String title, value;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorsManager.neutral700,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Icon(icon, size: 40, color: ColorsManager.primary700),
        title: Text(title, style: TextStyles.font20Meduim.copyWith(color: ColorsManager.white)),
        subtitle: Text(value, style: TextStyles.font24SemiBold.copyWith(color: ColorsManager.white)),
      ),
    );
  }
}

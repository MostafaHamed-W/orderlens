import 'package:flutter/material.dart';
import 'package:orderlens/core/helpers/extensions.dart';
import 'package:orderlens/core/helpers/spacing.dart';
import 'package:orderlens/core/theming/colors_manager.dart';
import 'package:orderlens/core/theming/styles.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CircularPerecentSection extends StatelessWidget {
  final double orderedPercentage;
  final double deliveredPercentage;
  final double returnedPercentage;

  const CircularPerecentSection({
    super.key,
    required this.orderedPercentage,
    required this.deliveredPercentage,
    required this.returnedPercentage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            // Only returned
            CircularPercentIndicator(
              radius: 110.0,
              lineWidth: 30.0,
              percent: 1.0, 
              progressColor: ColorsManager.primaryGreen,
              backgroundColor: Colors.transparent,
              circularStrokeCap: CircularStrokeCap.round,
            ),

            // Ordered + Delivered
            CircularPercentIndicator(
              radius: 110.0,
              lineWidth: 30.0,
              percent: orderedPercentage + deliveredPercentage,
              progressColor: ColorsManager.primaryBlue,
              backgroundColor: Colors.transparent,
              circularStrokeCap: CircularStrokeCap.round,
            ),

            // Only Ordered
            CircularPercentIndicator(
              radius: 110.0,
              lineWidth: 30.0,
              percent: orderedPercentage,
              progressColor: ColorsManager.primaryYellow,
              backgroundColor: Colors.transparent,
              circularStrokeCap: CircularStrokeCap.round,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${(deliveredPercentage) * 100}%',
                  style: TextStyles.font20SemiBold,
                ),
                Text(
                  'Delivered'.hardcoded,
                  style: TextStyles.font16Regular.copyWith(color: ColorsManager.lightGrey),
                ),
              ],
            ),
          ],
        ),
        verticalHight(30),
        _buildLegend(),
      ],
    );
  }

  Widget _buildLegend() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _LegendItem(color: ColorsManager.primaryGreen, label: 'Returned'),
        _LegendItem(color: ColorsManager.primaryYellow, label: 'Ordered'),
        _LegendItem(color: ColorsManager.primaryBlue, label: 'Delivered'),
      ],
    );
  }
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String label;

  const _LegendItem({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        horizentalWidth(10),
        Text(
          label,
          style: TextStyles.font14Regular,
        ),
      ],
    );
  }
}

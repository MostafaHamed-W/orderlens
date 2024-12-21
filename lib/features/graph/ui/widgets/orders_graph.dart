import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orderlens/core/helpers/extensions.dart';
import 'package:orderlens/core/helpers/spacing.dart';
import 'package:orderlens/core/theming/colors_manager.dart';
import 'package:orderlens/core/theming/styles.dart';
import 'package:orderlens/core/widgets/custom_subtitile_text.dart';

class OrdersGraph extends StatelessWidget {
  const OrdersGraph({
    super.key,
    required this.months,
    required this.values,
  });
  final List<String> months;
  final List<int> values;
  @override
  Widget build(BuildContext context) {
    final minValue = values.minValue.toDouble();
    final maxValue = values.maxValue.toDouble();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomSubtitleText(subTitle: 'Orders', alignEnd: false),
        verticalHight(10),
        SizedBox(
          height: 350.h,
          child: LineChart(
            LineChartData(
              minY: minValue - 1,
              maxY: maxValue + 1,
              titlesData: FlTitlesData(
                rightTitles: const AxisTitles(drawBelowEverything: false),
                topTitles: const AxisTitles(drawBelowEverything: false),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: maxValue - minValue < 15 ? 1 : 10,
                    getTitlesWidget: (value, meta) => Text(
                      value.toInt().toString(),
                      style: TextStyles.font10Regular,
                    ),
                  ),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 1,
                    getTitlesWidget: (value, meta) {
                      int index = value.toInt();
                      if (index >= 0 && index < months.length) {
                        return Text(months[index], style: TextStyles.font10Regular);
                      }
                      return Container();
                    },
                  ),
                ),
              ),
              borderData: FlBorderData(
                show: true,
                border: Border.all(color: Colors.grey, width: 1),
              ),
              lineBarsData: [
                LineChartBarData(
                  spots: List.generate(
                    months.length,
                    (index) => FlSpot(index.toDouble(), values[index].toDouble()),
                  ),
                  isCurved: true,
                  gradient: const LinearGradient(
                    colors: [ColorsManager.primaryBlue, ColorsManager.secondaryGreen],
                  ),
                  barWidth: 4,
                  belowBarData: BarAreaData(
                    show: true,
                    gradient: LinearGradient(
                      colors: [
                        ColorsManager.primaryBlue.withOpacity(0.1),
                        ColorsManager.secondaryGreen.withOpacity(0.1),
                      ],
                    ),
                  ),
                ),
              ],
              gridData: const FlGridData(show: true),
            ),
          ),
        ),
        CustomSubtitleText(subTitle: 'Months'.hardcoded, alignEnd: true),
      ],
    );
  }
}

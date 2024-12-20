import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orderlens/core/helpers/extensions.dart';
import 'package:orderlens/core/helpers/spacing.dart';
import 'package:orderlens/core/theming/colors_manager.dart';
import 'package:orderlens/core/theming/styles.dart';
import 'package:orderlens/core/widgets/custom_app_bar_widget.dart';
import 'package:orderlens/features/dashboard/ui/widgets/order_graph_data_component.dart';

class GraphPage extends StatelessWidget {
  const GraphPage({super.key});

  @override
  Widget build(BuildContext context) {
    final months = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'];
    final values = [10, 20, 30, 40, 50, 60, 70, 90, 90, 100, 110, 120];
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Orders graph'.hardcoded,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalHight(20),
              Text(
                'Orders over time'.hardcoded,
                style: TextStyles.font18MeduimSemiBold,
              ),
              verticalHight(15),
              Text(
                'Orders',
                style: TextStyles.font12Regular.copyWith(color: ColorsManager.lightGrey),
              ),
              verticalHight(10),
              SizedBox(
                height: 350.h,
                child: LineChart(
                  LineChartData(
                    titlesData: FlTitlesData(
                      rightTitles: const AxisTitles(
                        drawBelowEverything: false,
                      ),
                      topTitles: const AxisTitles(drawBelowEverything: false),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          interval: 10,
                          getTitlesWidget: (value, meta) => Text(value.toInt().toString(), style: TextStyles.font10Regular),
                        ),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          interval: 1, // Show labels every 3 months
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
                              // ColorsManager.primaryYellow.withOpacity(0.1),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    textAlign: TextAlign.end,
                    'Months',
                    style: TextStyles.font12Regular.copyWith(color: ColorsManager.lightGrey),
                  ),
                ],
              ),
              verticalHight(20),
              Text(
                'Orders per month',
                style: TextStyles.font18MeduimSemiBold,
              ),
              verticalHight(15),
              SizedBox(
                height: 80.h,
                child: ListView.separated(
                  // padding: EdgeInsets.symmetric(horizontal: 5.w),
                  scrollDirection: Axis.horizontal,
                  itemCount: 12,
                  itemBuilder: (_, index) => OrderGraphDataComponent(
                    title: Months.values[index].name,
                    icon: Icons.calendar_month,
                    value: '80',
                  ),
                  separatorBuilder: (_, index) => horizentalWidth(8.w),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum Months { jan, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, dec }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orderlens/core/helpers/extensions.dart';
import 'package:orderlens/core/helpers/spacing.dart';
import 'package:orderlens/core/theming/styles.dart';
import 'package:orderlens/core/widgets/custom_app_bar_widget.dart';
import 'package:orderlens/features/dashboard/ui/widgets/circular_perecent_section.dart';
import 'package:orderlens/features/dashboard/ui/widgets/metrics_card.dart';


class MetricsPage extends StatelessWidget {
  const MetricsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Orders Metrics'.hardcoded,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalHight(30),
              const CircularPerecentSection(
                orderedPercentage: 0.4,
                deliveredPercentage: 0.2,
                returnedPercentage: 0.1,
              ),
              verticalHight(20),
              Text(
                'Orders',
                style: TextStyles.font18MeduimSemiBold,
              ),
              verticalHight(15),
              MetricCard(
                title: 'Total Orders'.hardcoded,
                value: "1,234".hardcoded,
                details: '• 1000 Active  • 234 InActive'.hardcoded,
                icon: Icons.shopping_cart,
              ),
              verticalHight(16),
              MetricCard(
                title: 'Avg. Order Price'.hardcoded,
                value: "\$56.78",
                details: '• Highest \$214 • Lowest \$214'.hardcoded,
                icon: Icons.attach_money,
              ),
              verticalHight(16),
              MetricCard(
                title: 'Total Returns'.hardcoded,
                value: '89'.hardcoded,
                details: '• 80 Active  • 9 InActive'.hardcoded,
                icon: Icons.undo,
              ),
              verticalHight(20),
            ],
          ),
        ),
      ),
    );
  }
}



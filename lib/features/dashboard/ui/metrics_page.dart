import 'package:flutter/material.dart';
import 'package:orderlens/core/helpers/extensions.dart';
import 'package:orderlens/core/helpers/spacing.dart';
import 'package:orderlens/core/theming/colors_manager.dart';
import 'package:orderlens/core/widgets/custom_app_bar_widget.dart';
import 'package:orderlens/features/dashboard/ui/widgets/metrics_card.dart';

class MetricsPage extends StatelessWidget {
  const MetricsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.black,
      appBar: CustomAppBar(
        automaticallyImplyLeading: false,
        title: 'Metrics'.hardcoded,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            MetricCard(title: 'Total Orders'.hardcoded, value: '1,234'.hardcoded, icon: Icons.shopping_cart),
            verticalHight(16),
            MetricCard(title: 'Avg. Order Price'.hardcoded, value: '\$56.78'.hardcoded, icon: Icons.attach_money),
            verticalHight(16),
            MetricCard(title: 'Total Returns'.hardcoded, value: '89'.hardcoded, icon: Icons.undo),
          ],
        ),
      ),
    );
  }
}

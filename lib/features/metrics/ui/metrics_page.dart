import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orderlens/core/di/dependency_injection.dart';
import 'package:orderlens/core/helpers/extensions.dart';
import 'package:orderlens/core/helpers/spacing.dart';
import 'package:orderlens/core/widgets/custom_app_bar_widget.dart';
import 'package:orderlens/core/widgets/custom_title_text.dart';
import 'package:orderlens/features/metrics/data/models/orders_metrics_model.dart';
import 'package:orderlens/features/metrics/logic/metrics_cubit/order_metrics_cubit.dart';
import 'package:orderlens/features/metrics/logic/metrics_cubit/order_metrics_state.dart';
import 'package:orderlens/features/metrics/ui/widgets/circular_perecent_section.dart';
import 'package:orderlens/features/metrics/ui/widgets/metrics_card.dart';

class MetricsPage extends StatelessWidget {
  const MetricsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ordersMetricsCubit = context.read<OrderMetricsCubit>();
    return Scaffold(
      appBar: CustomAppBar(title: 'Orders Metrics'.hardcoded),
      body: RefreshIndicator(
        onRefresh: () => ordersMetricsCubit.fetchMetrics(),
        child: BlocBuilder<OrderMetricsCubit, OrderMetricsState>(
          builder: (context, state) {
            return state.when(
              initial: () => const SizedBox.shrink(),
              loading: () => const Center(child: CircularProgressIndicator()),
              success: (metrics) => _buildMetricsContent(metrics),
              failure: (message) => Center(child: Text('Error: $message')),
            );
          },
        ),
      ),
    );
  }

  Widget _buildMetricsContent(OrderMetricsModel metrics) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalHight(30),
          CircularPerecentSection(
            orderedPercentage: metrics.orderedPercentage,
            deliveredPercentage: metrics.deliveredPercentage,
            returnedPercentage: metrics.returnedPercentage,
          ),
          verticalHight(20),
          CustomTitleText(title: 'Orders Summary'.hardcoded),
          verticalHight(15),
          MetricCard(
            title: 'Total Orders'.hardcoded,
            value: '${metrics.totalOrders.toString()} order',
            details: '${metrics.activeOrders} Active • ${metrics.inactiveOrders} Inactive'.hardcoded,
            icon: Icons.shopping_cart,
          ),
          verticalHight(16),
          MetricCard(
            title: 'Avg. Order Price'.hardcoded,
            value: '${metrics.avgPrice.toStringAsFixed(2)} \$',
            details: 'Highest: ${metrics.highestPrice.toStringAsFixed(2)} \$'.hardcoded,
            icon: Icons.attach_money,
          ),
          verticalHight(16),
          MetricCard(
            title: 'Total Returns'.hardcoded,
            value: '${metrics.returnedOrders.toString()} return',
            icon: Icons.undo,
          ),
          verticalHight(100),
        ],
      ),
    );
  }
}

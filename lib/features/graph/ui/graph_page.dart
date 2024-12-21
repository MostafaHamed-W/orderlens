import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orderlens/core/di/dependency_injection.dart';
import 'package:orderlens/core/helpers/extensions.dart';
import 'package:orderlens/core/helpers/spacing.dart';
import 'package:orderlens/core/utilites/helper_functions.dart';
import 'package:orderlens/core/widgets/custom_app_bar_widget.dart';
import 'package:orderlens/core/widgets/custom_title_text.dart';
import 'package:orderlens/features/graph/data/models/grouped_orders_model.dart';
import 'package:orderlens/features/graph/logic/graph_cubit/orders_cubit.dart';
import 'package:orderlens/features/graph/logic/graph_cubit/orders_state.dart';
import 'package:orderlens/features/graph/ui/widgets/orders_graph.dart';
import 'package:orderlens/features/graph/ui/widgets/orders_per_month_widget.dart';

class GraphPage extends StatelessWidget {
  const GraphPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Orders graph'.hardcoded),
      body: BlocProvider(
        create: (_) => getIt<OrdersCubit>()..fetchOrders(),
        child: BlocBuilder<OrdersCubit, OrdersState>(
          builder: (context, state) {
            return state.when(
              initial: () => const SizedBox.shrink(),
              loading: () => const Center(child: CircularProgressIndicator()),
              success: (groupedOrders) => _buildGraphContent(groupedOrders),
              failure: (message) => Center(child: Text('Error: $message')),
            );
          },
        ),
      ),
    );
  }

  Widget _buildGraphContent(List<GroupedOrdersModel> groupedOrders) {
    final months = groupedOrders.map((order) => order.date.monthName).toList();
    final values = groupedOrders.map((order) => order.orderCount).toList();

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalHight(20),
          CustomTitleText(title: 'Orders over time for ${HelperFunctions.getYears(groupedOrders)}'.hardcoded),
          verticalHight(15),
          OrdersGraph(months: months, values: values),
          verticalHight(20),
          CustomTitleText(title: 'Orders per month'.hardcoded),
          verticalHight(15),
          OrdersPerMonthWidget(groupedOrders: groupedOrders),
          verticalHight(100),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orderlens/core/helpers/extensions.dart';
import 'package:orderlens/core/helpers/spacing.dart';
import 'package:orderlens/features/graph/data/models/grouped_orders_model.dart';
import 'package:orderlens/features/graph/ui/widgets/order_graph_data_component.dart';

class OrdersPerMonthWidget extends StatelessWidget {
  const OrdersPerMonthWidget({
    super.key,
    required this.groupedOrders,
  });
  final List<GroupedOrdersModel> groupedOrders;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: groupedOrders.length,
        itemBuilder: (_, index) {
          final order = groupedOrders[index];
          return OrderGraphDataComponent(
            title: order.date.fullMonthName,
            icon: Icons.calendar_month,
            value: order.orderCount.toString(),
          );
        },
        separatorBuilder: (_, __) => horizentalWidth(8.w),
      ),
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:orderlens/features/graph/data/models/grouped_orders_graph_model.dart';

class HelperFunctions {
  // Helper method to get the years of orders
  static String getYears(List<GroupedOrdersGraphModel> groupedOrders) {
    // Get the years of the orders
    // Using set to make year unique
    final years = groupedOrders.map((order) => order.date.year).toSet().toList()..sort();
    if (years.length == 1) {
      return years.first.toString();
    } else if (years.length > 1) {
      return '${years.first} - ${years.last}';
    }
    return '';
  }

  /// Adjusts text scaling specifically for web, without affecting mobile behavior
  static Widget webBuilder(BuildContext context, Widget? child) {
    const isWeb = kIsWeb;
    final mediaQuery = MediaQuery.of(context);
    return MediaQuery(
      data: mediaQuery.copyWith(
        textScaler: const TextScaler.linear(isWeb ? 0.6 : 1.0),
      ),
      child: child!,
    );
  }
}

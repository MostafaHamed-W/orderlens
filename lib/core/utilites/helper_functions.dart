import 'package:orderlens/features/graph/data/models/grouped_orders_model.dart';

class HelperFunctions {
  // Helper method to get the years of orders
  static String getYears(List<GroupedOrdersModel> groupedOrders) {
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
}

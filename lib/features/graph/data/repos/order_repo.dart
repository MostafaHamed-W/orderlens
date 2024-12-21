import 'package:orderlens/core/services/data_result.dart';
import 'package:orderlens/core/services/local_data_service.dart';
import 'package:orderlens/features/graph/data/models/grouped_orders_model.dart';
import 'package:orderlens/features/graph/data/models/order_model.dart';

class OrderRepo {
  final LocalDataService _localDataService;

  OrderRepo(this._localDataService);

  Future<DataResult<List<GroupedOrdersModel>>> getOrdersGroupedByMonth() async {
    try {
      // Fetch all orders
      final orders = await _localDataService.getOrders();

      // Group orders by month
      final Map<DateTime, int> monthOrderCounts = {};
      for (OrderModel order in orders) {
        final DateTime monthDate = DateTime(order.registered.year, order.registered.month);
        monthOrderCounts.update(monthDate, (count) => count + 1, ifAbsent: () => 1);
      }

      // Convert grouped data to a list of models and sort by date
      final groupedOrders = monthOrderCounts.entries
          .map((entry) => GroupedOrdersModel(
                date: entry.key,
                orderCount: entry.value,
              ))
          .toList()
        ..sort((a, b) => a.date.compareTo(b.date));

      return DataResult.success(groupedOrders);
    } catch (e) {
      return DataResult.failure(e.toString());
    }
  }
}

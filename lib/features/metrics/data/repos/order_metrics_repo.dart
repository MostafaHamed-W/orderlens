import 'package:orderlens/core/services/data_result.dart';
import 'package:orderlens/core/services/local_data_service.dart';
import 'package:orderlens/features/metrics/data/models/orders_metrics_model.dart';

class OrderMetricsRepository {
  final LocalDataService _localDataService;

  OrderMetricsRepository(this._localDataService);

  Future<DataResult<OrderMetricsModel>> getOrderMetrics() async {
    try {
      final orders = await _localDataService.getOrders();

      // Calculate metrics
      final int totalOrders = orders.length;
      final int orderedOrders = orders.where((o) => o.status.toUpperCase() == 'ORDERED').length;
      final int deliveredOrders = orders.where((o) => o.status.toUpperCase() == 'DELIVERED').length;
      final int returnedOrders = orders.where((o) => o.status.toUpperCase() == 'RETURNED').length;

      final prices = orders.map((o) => double.tryParse(o.price.replaceAll(RegExp(r'[$,]'), '')) ?? 0).toList();
      final double avgPrice = prices.isNotEmpty ? prices.reduce((a, b) => a + b) / prices.length : 0;
      final double highestPrice = prices.isNotEmpty ? prices.reduce((a, b) => a > b ? a : b) : 0;
      final double lowestPrice = prices.isNotEmpty ? prices.reduce((a, b) => a < b ? a : b) : 0;

      final double orderedPercentage = totalOrders > 0 ? orderedOrders / totalOrders : 0;
      final double deliveredPercentage = totalOrders > 0 ? deliveredOrders / totalOrders : 0;
      final double returnedPercentage = totalOrders > 0 ? returnedOrders / totalOrders : 0;

      final metrics = OrderMetricsModel(
        totalOrders: totalOrders,
        activeOrders: orders.where((o) => o.isActive).length,
        inactiveOrders: orders.where((o) => !o.isActive).length,
        deliveredOrders: deliveredOrders,
        returnedOrders: returnedOrders,
        avgPrice: avgPrice,
        highestPrice: highestPrice,
        lowestPrice: lowestPrice,
        orderedPercentage: orderedPercentage,
        deliveredPercentage: deliveredPercentage,
        returnedPercentage: returnedPercentage,
      );

      return DataResult.success(metrics);
    } catch (e) {
      return DataResult.failure(e.toString());
    }
  }
}

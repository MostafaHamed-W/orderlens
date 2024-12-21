import 'package:json_annotation/json_annotation.dart';
part 'orders_metrics_model.g.dart';

@JsonSerializable()
class OrderMetricsModel {
  final int totalOrders;
  final int activeOrders;
  final int inactiveOrders;
  final int deliveredOrders;
  final int returnedOrders;
  final double avgPrice;
  final double highestPrice;
  final double lowestPrice;
  final double orderedPercentage;
  final double deliveredPercentage;
  final double returnedPercentage;

  OrderMetricsModel({
    required this.totalOrders,
    required this.activeOrders,
    required this.inactiveOrders,
    required this.deliveredOrders,
    required this.returnedOrders,
    required this.avgPrice,
    required this.highestPrice,
    required this.lowestPrice,
    required this.orderedPercentage,
    required this.deliveredPercentage,
    required this.returnedPercentage,
  });

  factory OrderMetricsModel.fromJson(Map<String, dynamic> json) => _$OrderMetricsModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderMetricsModelToJson(this);
}

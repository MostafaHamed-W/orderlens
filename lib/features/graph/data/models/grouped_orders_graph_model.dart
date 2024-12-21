import 'package:json_annotation/json_annotation.dart';
part 'grouped_orders_graph_model.g.dart';

@JsonSerializable()
class GroupedOrdersGraphModel {
  final DateTime date;
  final int orderCount;

  GroupedOrdersGraphModel({
    required this.date,
    required this.orderCount,
  });

  factory GroupedOrdersGraphModel.fromJson(Map<String, dynamic> json) => _$GroupedOrdersGraphModelFromJson(json);

  Map<String, dynamic> toJson() => _$GroupedOrdersGraphModelToJson(this);
}

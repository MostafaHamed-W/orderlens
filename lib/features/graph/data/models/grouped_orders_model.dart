import 'package:json_annotation/json_annotation.dart';
part 'grouped_orders_model.g.dart';

@JsonSerializable()
class GroupedOrdersModel {
  final DateTime date;
  final int orderCount;

  GroupedOrdersModel({
    required this.date,
    required this.orderCount,
  });

  factory GroupedOrdersModel.fromJson(Map<String, dynamic> json) => _$GroupedOrdersModelFromJson(json);

  Map<String, dynamic> toJson() => _$GroupedOrdersModelToJson(this);
}

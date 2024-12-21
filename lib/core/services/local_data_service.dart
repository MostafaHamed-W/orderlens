import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:orderlens/core/helpers/assets_paths.dart';
import 'package:orderlens/features/graph/data/models/order_model.dart';

class LocalDataService {
  Future<List<OrderModel>> getOrders() async {
    final String jsonString = await rootBundle.loadString(AssetsPaths.orderJson);
    final List<dynamic> jsonData = jsonDecode(jsonString);
    return jsonData.map((order) => OrderModel.fromJson(order)).toList();
  }
}

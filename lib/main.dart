import 'package:flutter/material.dart';
import 'package:orderlens/core/routing/app_router.dart';
import 'package:orderlens/order_lens.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(OrderLens(appRouter: AppRouter()));
}

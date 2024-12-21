import 'package:flutter/material.dart';
import 'package:orderlens/core/di/dependency_injection.dart';
import 'package:orderlens/core/routing/app_router.dart';
import 'package:orderlens/order_lens.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupGetIt();
  await initializeDateFormatting();
  runApp(OrderLens(appRouter: AppRouter()));
}

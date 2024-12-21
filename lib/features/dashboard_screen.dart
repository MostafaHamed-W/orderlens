import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orderlens/core/di/dependency_injection.dart';
import 'package:orderlens/core/widgets/bottom_navigation_bar_widget.dart';
import 'package:orderlens/features/graph/logic/graph_cubit/orders_graph_cubit.dart';
import 'package:orderlens/features/graph/ui/graph_page.dart';
import 'package:orderlens/features/metrics/logic/metrics_cubit/order_metrics_cubit.dart';
import 'package:orderlens/features/metrics/ui/metrics_page.dart';
import 'package:animations/animations.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  DashboardScreenState createState() => DashboardScreenState();
}

class DashboardScreenState extends State<DashboardScreen> {
  SelectedTab _selectedTab = SelectedTab.metrics;

  Widget _getPage(SelectedTab tab) {
    switch (tab) {
      case SelectedTab.metrics:
        return const MetricsPage();
      case SelectedTab.graph:
        return const GraphPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //* Moved BlocProviders here instead of each page
      //* To avoid fetching data from data source every time moving between pages
      //* And fetch data from data source only once at first time opened the page
      //* Added refresh indicator to each page to refresh data manually
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => getIt<OrdersGraphCubit>()..fetchOrders()),
          BlocProvider(create: (_) => getIt<OrderMetricsCubit>()..fetchMetrics()),
        ],
        child: PageTransitionSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (child, animation, secondaryAnimation) {
            return FadeScaleTransition(
              animation: animation,
              child: child,
            );
          },
          child: _getPage(_selectedTab),
        ),
      ),
      bottomNavigationBar: BottomNavBarWidget(
        currentTab: _selectedTab,
        onTabSelected: (index) {
          setState(() {
            _selectedTab = SelectedTab.values[index];
          });
        },
      ),
    );
  }
}

enum SelectedTab { metrics, graph }

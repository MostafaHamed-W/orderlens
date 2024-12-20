import 'package:flutter/material.dart';
import 'package:orderlens/core/widgets/bottom_navigation_bar_widget.dart';
import 'package:orderlens/features/dashboard/ui/graph_page.dart';
import 'package:orderlens/features/dashboard/ui/metrics_page.dart';
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
      body: PageTransitionSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (child, animation, secondaryAnimation) {
          return FadeScaleTransition(
            animation: animation,
            child: child,
          );
        },
        child: _getPage(_selectedTab),
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

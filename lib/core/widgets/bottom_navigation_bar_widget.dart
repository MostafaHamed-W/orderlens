import 'package:flutter/material.dart';
import 'package:orderlens/core/helpers/extensions.dart';
import 'package:orderlens/core/theming/colors_manager.dart';
import 'package:orderlens/features/dashboard/ui/dashboard_screen.dart';

class BottomNavBarWidget extends StatelessWidget {
  final SelectedTab currentTab;
  final Function(int) onTabSelected;

  const BottomNavBarWidget({
    super.key,
    required this.currentTab,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: SelectedTab.values.indexOf(currentTab),
      onTap: onTabSelected,
      backgroundColor: ColorsManager.black,
      selectedItemColor: ColorsManager.primary700,
      unselectedItemColor: ColorsManager.neutral400,
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.analytics),
          label: 'Metrics'.hardcoded,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.bar_chart),
          label: 'Graph'.hardcoded,
        ),
      ],
    );
  }
}

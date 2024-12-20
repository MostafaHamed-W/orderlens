import 'package:flutter/material.dart';
import 'package:orderlens/core/helpers/extensions.dart';
import 'package:orderlens/core/theming/colors_manager.dart';
import 'package:orderlens/core/theming/styles.dart';
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
      elevation: 2,
      
      currentIndex: SelectedTab.values.indexOf(currentTab),
      onTap: onTabSelected,
      backgroundColor: ColorsManager.backgroundColor,
      selectedItemColor: ColorsManager.primaryBlue,
      unselectedItemColor: ColorsManager.neutral400,
      selectedLabelStyle: TextStyles.font14Meduim,
      unselectedLabelStyle: TextStyles.font12Regular,
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

import 'package:flutter/material.dart';
import 'package:kalpas_task/models/custom_tab_bar_item.dart';
import 'package:kalpas_task/widgets/custom_tab_bar.dart';

class CustomTabView extends StatelessWidget {
  final List<CustomTabBarItem> tabBarItems;
  final List<Widget> tabViewItems;
  final int selectedIndex;
  final ValueChanged<int> onTabPressed;
  final Color activeTabColor;
  final Color? inactiveTabColor;
  final TextStyle tabItemTextStyle;
  const CustomTabView({
    super.key,
    required this.tabBarItems,
    required this.selectedIndex,
    required this.onTabPressed,
    required this.activeTabColor,
    this.inactiveTabColor,
    required this.tabItemTextStyle,
    required this.tabViewItems,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTabBar(
        items: tabBarItems,
        currentIndex: selectedIndex,
        onTap: (value) => onTabPressed(value),
        activeTabColor: activeTabColor,
        inactiveTabColor: inactiveTabColor,
        tabItemTextStyle: tabItemTextStyle,
      ),
      body: Center(
        child: tabViewItems[selectedIndex],
      ),
    );
  }
}

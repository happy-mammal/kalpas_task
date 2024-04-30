import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kalpas_task/models/custom_tab_bar_item.dart';

class CustomTabBar extends StatelessWidget implements PreferredSizeWidget {
  final List<CustomTabBarItem> items;
  final int currentIndex;
  final ValueChanged<int> onTap;
  final Color activeTabColor;
  final Color? inactiveTabColor;
  final TextStyle tabItemTextStyle;
  const CustomTabBar({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
    required this.activeTabColor,
    this.inactiveTabColor,
    required this.tabItemTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 9.h, horizontal: 27.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(
            items.length,
            (index) => InkWell(
              borderRadius: BorderRadius.circular(6.r),
              onTap: () => onTap(index),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6.r),
                child: Container(
                  width: 178.w,
                  height: 57.h,
                  padding:
                      EdgeInsets.symmetric(vertical: 12.h, horizontal: 28.w),
                  color:
                      currentIndex == index ? activeTabColor : inactiveTabColor,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        items[index].icon,
                        size: items[index].iconSize,
                        color: items[index].iconColor,
                      ),
                      Text(
                        items[index].title,
                        style: tabItemTextStyle,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(75.h);
}

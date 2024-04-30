import 'package:flutter/material.dart';

class CustomTabBarItem {
  final String title;
  final Color? iconColor;
  final double iconSize;
  final IconData icon;

  CustomTabBarItem(
      {required this.title,
      this.iconColor,
      required this.iconSize,
      required this.icon});
}

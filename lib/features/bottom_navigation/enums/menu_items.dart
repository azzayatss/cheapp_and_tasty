import 'package:flutter/material.dart';

enum MenuItems {
  home(
    activeIcon: Icon(Icons.home),
    icon: Icon(Icons.home_outlined),
  ),
  map(
    activeIcon: Icon(Icons.map),
    icon: Icon(Icons.map_outlined),
  ),
  list(
    activeIcon: Icon(Icons.list),
    icon: Icon(Icons.list_outlined),
  ),
  settings(
    activeIcon: Icon(Icons.settings),
    icon: Icon(Icons.settings_outlined),
  );

  const MenuItems({
    required this.activeIcon,
    required this.icon,
  });

  final Icon activeIcon;
  final Icon icon;
}

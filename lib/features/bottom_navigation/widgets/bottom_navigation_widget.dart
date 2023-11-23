import 'package:cheapp_and_tasty/extensions/build_context_extension.dart';
import 'package:cheapp_and_tasty/features/bottom_navigation/enums/menu_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

class BottomNavigationWidget extends HookWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final menuItem = useState(MenuItems.home);

    return BottomNavigationBar(
      currentIndex: menuItem.value.index,
      onTap: (index) {
        menuItem.value = MenuItems.values[index];
        context.go(MenuItems.values[index].route);
      },
      items: MenuItems.values
          .map(
            (value) => BottomNavigationBarItem(
              activeIcon: value.activeIcon,
              icon: value.icon,
              label: value.text(locale: context.tr),
            ),
          )
          .toList(),
    );
  }
}

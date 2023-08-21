import 'package:cheapp_and_tasty/extensions/build_context_extension.dart';
import 'package:cheapp_and_tasty/features/bottom_navigation/controllers/bottom_navigation_index_controller.dart';
import 'package:cheapp_and_tasty/features/bottom_navigation/enums/menu_items.dart';
import 'package:cheapp_and_tasty/features/home/screens/home_screen.dart';
import 'package:cheapp_and_tasty/features/location/locations_listing/screens/locations_listing_screen.dart';
import 'package:cheapp_and_tasty/features/map/screens/map_screen.dart';
import 'package:cheapp_and_tasty/features/settings/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BottomNavigationWidget extends ConsumerStatefulWidget {
  const BottomNavigationWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState
    extends ConsumerState<BottomNavigationWidget> {
  @override
  Widget build(BuildContext context) {
    final menuItem = ref.watch(bottomNavigationIndexControllerProvider);
    return BottomNavigationBar(
      currentIndex: menuItem.index,
      onTap: _onTap,
      items: MenuItems.values
          .map(
            (value) => BottomNavigationBarItem(
              activeIcon: value.activeIcon,
              icon: value.icon,
              label: _text(context: context, menuItems: value),
            ),
          )
          .toList(),
    );
  }

  void _onTap(int index) {
    ref
        .read(bottomNavigationIndexControllerProvider.notifier)
        .setIndex(MenuItems.values[index]);

    context.go(
      switch (index) {
        0 => HomeScreen.route,
        1 => MapScreen.route,
        2 => LocationsListScreen.route,
        3 => SettingsScreen.route,
        _ => ''
      },
    );
  }

  String _text({
    required MenuItems menuItems,
    required BuildContext context,
  }) {
    return switch (menuItems) {
      MenuItems.home => context.tr.navigationBarLabel0,
      MenuItems.map => context.tr.navigationBarLabel1,
      MenuItems.list => context.tr.navigationBarLabel2,
      MenuItems.settings => context.tr.navigationBarLabel3,
    };
  }
}

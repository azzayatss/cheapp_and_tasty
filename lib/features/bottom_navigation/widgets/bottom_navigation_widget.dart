import 'package:cheapp_and_tasty/extensions/build_context_extension.dart';
import 'package:cheapp_and_tasty/features/bottom_navigation/controllers/bottom_navigation_controller.dart';
import 'package:cheapp_and_tasty/features/home/screens/home_screen.dart';
import 'package:cheapp_and_tasty/features/location_list/screens/location_list_screen.dart';
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
    final menuIndex = ref.watch(bottomNavBarControllerProvider);
    return BottomNavigationBar(
      currentIndex: menuIndex,
      onTap: _onTap,
      items: [
        BottomNavigationBarItem(
          activeIcon: const Icon(Icons.home),
          icon: const Icon(Icons.home_outlined),
          label: context.tr.navigationBarLabel0,
        ),
        BottomNavigationBarItem(
          activeIcon: const Icon(Icons.map),
          icon: const Icon(Icons.map_outlined),
          label: context.tr.navigationBarLabel1,
        ),
        BottomNavigationBarItem(
          activeIcon: const Icon(Icons.list),
          icon: const Icon(Icons.list_outlined),
          label: context.tr.navigationBarLabel2,
        ),
        BottomNavigationBarItem(
          activeIcon: const Icon(Icons.settings),
          icon: const Icon(Icons.settings_outlined),
          label: context.tr.navigationBarLabel3,
        ),
      ],
    );
  }

  void _onTap(int index) {
    ref.read(bottomNavBarControllerProvider.notifier).setIndex(index);
    return switch (index) {
      0 => context.go(HomeScreen.route),
      1 => context.go(MapScreen.route),
      2 => context.go(LocationListScreen.route),
      3 => context.go(SettingsScreen.route),
      _ => ''
    };
  }
}

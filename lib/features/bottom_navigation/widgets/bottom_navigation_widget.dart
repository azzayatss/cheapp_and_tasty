import 'package:cheapp_and_tasty/features/bottom_navigation/state/bottom_navigation_state.dart';
import 'package:cheapp_and_tasty/screens/home_screen.dart';
import 'package:cheapp_and_tasty/screens/list_screen.dart';
import 'package:cheapp_and_tasty/screens/map_screen.dart';
import 'package:cheapp_and_tasty/screens/settings_screen.dart';
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
    final menuIndex = ref.watch(botoomNavigationControllerProvider);
    return BottomNavigationBar(
      currentIndex: menuIndex,
      onTap: _onTap,
      items: const [
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.home),
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.map),
          icon: Icon(Icons.map_outlined),
          label: 'Map',
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.list),
          icon: Icon(Icons.list_outlined),
          label: 'List',
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.settings),
          icon: Icon(Icons.settings_outlined),
          label: 'Settings',
        ),
      ],
    );
  }

  void _onTap(int index) {
    ref.read(botoomNavigationControllerProvider.notifier).setIndex(index);
    return switch (index) {
      0 => context.go(HomeScreen.route),
      1 => context.go(MapScreen.route),
      2 => context.go(ListScreen.route),
      3 => context.go(SettingsScreen.route),
      _ => ''
    };
  }
}

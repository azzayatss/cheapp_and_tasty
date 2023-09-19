import 'package:cheapp_and_tasty/features/home/screens/home_screen.dart';
import 'package:cheapp_and_tasty/features/locations_listing/screens/listing_screen.dart';
import 'package:cheapp_and_tasty/features/map/screens/map_screen.dart';
import 'package:cheapp_and_tasty/features/settings/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum MenuItems {
  home(
    activeIcon: Icon(Icons.home),
    icon: Icon(Icons.home_outlined),
    route: HomeScreen.route,
  ),
  map(
    activeIcon: Icon(Icons.map),
    icon: Icon(Icons.map_outlined),
    route: MapScreen.route,
  ),
  list(
    activeIcon: Icon(Icons.list),
    icon: Icon(Icons.list_outlined),
    route: ListingScreen.route,
  ),
  settings(
    activeIcon: Icon(Icons.settings),
    icon: Icon(Icons.settings_outlined),
    route: SettingsScreen.route,
  );

  const MenuItems({
    required this.activeIcon,
    required this.icon,
    required this.route,
  });

  final Icon activeIcon;
  final Icon icon;
  final String route;

  String text({
    required AppLocalizations locale,
  }) {
    return switch (this) {
      MenuItems.home => locale.navigationBarLabel0,
      MenuItems.map => locale.navigationBarLabel1,
      MenuItems.list => locale.navigationBarLabel2,
      MenuItems.settings => locale.navigationBarLabel3,
    };
  }
}

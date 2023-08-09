import 'package:cheapp_and_tasty/features/auth/controllers/is_logged_in_controller.dart';
import 'package:cheapp_and_tasty/features/auth/screens/auth_gate_screen.dart';
import 'package:cheapp_and_tasty/features/home/screens/home_screen.dart';
import 'package:cheapp_and_tasty/features/location/locations_listing/screens/locations_listing_screen.dart';
import 'package:cheapp_and_tasty/features/map/screens/map_screen.dart';
import 'package:cheapp_and_tasty/features/settings/screens/settings_screen.dart';
import 'package:cheapp_and_tasty/features/main_scaffold/screens/main_scaffold_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'go_router_config.g.dart';

final GlobalKey<NavigatorState> _shellNavigator =
    GlobalKey(debugLabel: 'shell');

@riverpod
GoRouter router(RouterRef ref) {
  return GoRouter(
    routes: [
      GoRoute(
        // '/'
        path: MainScaffoldScreen.route,
        redirect: (context, state) => HomeScreen.route,
      ),
      ShellRoute(
        navigatorKey: _shellNavigator,
        builder: (context, state, child) => MainScaffoldScreen(
          key: state.pageKey,
          child: child,
        ),
        routes: [
          GoRoute(
            path: HomeScreen.route,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: HomeScreen(),
            ),
          ),
          // same as in 1 sub-route
          GoRoute(
            path: MapScreen.route,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: MapScreen(),
            ),
          ),
          // same as in 1 sub-route
          GoRoute(
            path: LocationListScreen.route,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: LocationListScreen(),
            ),
          ),
          // same as in 1 sub-route
          GoRoute(
            path: SettingsScreen.route,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: SettingsScreen(),
            ),
          ),
        ],
      ),
      GoRoute(
        path: AuthGateScreen.route,
        builder: (context, state) => const AuthGateScreen(),
      ),
    ],
    redirect: (context, state) {
      //result from .authStateChanges(); which is returning
      //null - if user is not logged in, or User? data if so.
      //based on this we are watching this stream and returning bool here,
      //to can work with it. if true.... if false ...
      final isLoggedIn = ref.watch(isLoggedInProvider);

      // addittional check to see is user going to go to the login page.
      // explanation below
      final goingToLogin = state.location.contains(AuthGateScreen.route);

      // if user is not logged in, and he trying to go to settings screen via
      //deeplink - this is incorrect. Thats why we checking additionaly where user
      // going to go.
      if (!isLoggedIn && !goingToLogin) {
        return AuthGateScreen.route;
      }

      //if user is not logged in and he trying to go to login page
      // - it's ok.
      if (isLoggedIn && goingToLogin) {
        return MainScaffoldScreen.route;
      }

      // in other cases we dont need redirection.
      return null;
    },
  );
}

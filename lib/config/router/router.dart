import 'package:cheapp_and_tasty/features/auth/controllers/is_logged_in_controller.dart';
import 'package:cheapp_and_tasty/features/auth/screens/auth_gate_screen.dart';
import 'package:cheapp_and_tasty/features/home/screens/home_screen.dart';
import 'package:cheapp_and_tasty/features/location/add_location/screens/add_new_location_screen.dart';
import 'package:cheapp_and_tasty/features/location/location_full_page/screeens/location_full_page_screen.dart';
import 'package:cheapp_and_tasty/features/location/location_full_page/widgets/location_images_full_screen_slider.dart';
import 'package:cheapp_and_tasty/features/location/location_full_page/widgets/location_menu_full_screen_slider.dart';
import 'package:cheapp_and_tasty/features/location/locations_listing/screens/locations_listing_screen.dart';
import 'package:cheapp_and_tasty/features/main_scaffold/screens/main_scaffold_screen.dart';
import 'package:cheapp_and_tasty/features/map/screens/map_screen.dart';
import 'package:cheapp_and_tasty/features/settings/screens/app_theme_mode_screen.dart';
import 'package:cheapp_and_tasty/features/settings/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

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
            pageBuilder: (context, state) => NoTransitionPage(
              child: MapScreen(),
            ),
          ),
          // same as in 1 sub-route
          GoRoute(
            path: LocationsListScreen.route,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: LocationsListScreen(),
            ),
            routes: [
              GoRoute(
                path: AddNewLocationScreen.route,
                name: AddNewLocationScreen.routeName,
                builder: (context, state) => const AddNewLocationScreen(),
              ),
              GoRoute(
                path: LocationFullScreen.route,
                name: LocationFullScreen.routeName,
                builder: (context, state) => LocationFullScreen(
                  id: state.pathParameters['locationId']!,
                ),
                routes: [
                  GoRoute(
                    path: LocationMenuFullScreenSlider.route,
                    name: LocationMenuFullScreenSlider.routeName,
                    builder: (context, state) => LocationMenuFullScreenSlider(
                      id: state.pathParameters['id']!,
                    ),
                  ),
                  GoRoute(
                    path: LocationImagesFullScreenSlider.route,
                    name: LocationImagesFullScreenSlider.routeName,
                    builder: (context, state) => LocationImagesFullScreenSlider(
                      id: state.pathParameters['idImages']!,
                    ),
                  ),
                ],
              ),
            ],
          ),
          // same as in 1 sub-route
          GoRoute(
            path: SettingsScreen.route,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: SettingsScreen(),
            ),
            routes: [
              GoRoute(
                path: AppThemeModeScreen.route,
                name: AppThemeModeScreen.routeName,
                builder: (context, state) => const AppThemeModeScreen(),
              ),
            ],
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

import 'package:cheapp_and_tasty/features/auth/state/is_logged_in_controller.dart';
import 'package:cheapp_and_tasty/screens/auth_gate_screen.dart';
import 'package:cheapp_and_tasty/screens/home_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'go_router_config.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  return GoRouter(
    routes: [
      GoRoute(
        // '/'
        path: HomeScreen.route,
        builder: (context, state) => const HomeScreen(),
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
        return HomeScreen.route;
      }

      // in other cases we dont need redirection.
      return null;
    },
  );
}

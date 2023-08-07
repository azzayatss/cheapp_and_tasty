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
        path: HomeScreen.route,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: AuthGateScreen.route,
        builder: (context, state) => const AuthGateScreen(),
      ),
    ],
    redirect: (context, state) {
      final isLoggedIn = ref.watch(isLoggedInProvider);
      if (isLoggedIn) {
        return null;
      }
      return AuthGateScreen.route;
    },
  );
}

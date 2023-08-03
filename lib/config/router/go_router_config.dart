import 'package:cheapp_and_tasty/screens/home_screen.dart';
import 'package:cheapp_and_tasty/screens/sign_in_screen.dart';
import 'package:cheapp_and_tasty/screens/sign_up_screen.dart';
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
        path: SignInScreen.route,
        builder: (context, state) => const SignInScreen(),
      ),
      GoRoute(
        path: SignUpScreen.route,
        builder: (context, state) => const SignUpScreen(),
      ),
    ],
  );
}

// class Routes {
//   static GoRouter router = GoRouter(
//     routes: [
//       GoRoute(
//         path: MyHomePage.route,
//         builder: (context, state) => const MyHomePage(),
//       ),
//       GoRoute(
//         path: SignInPage.route,
//         builder: (context, state) => const SignInPage(),
//       ),
//       GoRoute(
//         path: SignUpPage.route,
//         builder: (context, state) => const SignUpPage(),
//       ),
//       GoRoute(
//         path: AppMainScreen.route,
//         builder: (context, state) => const AppMainScreen(),
//       ),
//     ],
//   );
// }

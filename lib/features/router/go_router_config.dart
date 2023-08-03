import 'package:cheapp_and_tasty/features/app_main_screen/app_main_screen.dart';
import 'package:cheapp_and_tasty/features/auth/pages/sign_in_page.dart';
import 'package:cheapp_and_tasty/features/auth/pages/sign_up_page.dart';
import 'package:cheapp_and_tasty/main.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: MyHomePage.route,
        builder: (context, state) => const MyHomePage(),
      ),
      GoRoute(
        path: SignInPage.route,
        builder: (context, state) => const SignInPage(),
      ),
      GoRoute(
        path: SignUpPage.route,
        builder: (context, state) => const SignUpPage(),
      ),
      GoRoute(
        path: AppMainScreen.route,
        builder: (context, state) => const AppMainScreen(),
      ),
    ],
  );
}

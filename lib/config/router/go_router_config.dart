import 'package:cheapp_and_tasty/screens/home_screen.dart';
import 'package:cheapp_and_tasty/screens/sign_in_screen.dart';
import 'package:cheapp_and_tasty/screens/sign_up_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'go_router_config.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  return GoRouter(
    routes: [
      GoRoute(
        path: HomeScreen.route,
        builder: (context, state) {
          return StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const SignInScreen();
              }
              return const HomeScreen();
            },
          );
        },
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

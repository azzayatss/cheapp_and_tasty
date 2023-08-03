import 'package:cheapp_and_tasty/config/app_strings.dart';
import 'package:cheapp_and_tasty/features/auth/state/auth_state.dart';
import 'package:cheapp_and_tasty/main.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppMainScreen extends ConsumerWidget {
  const AppMainScreen({super.key});
  static const String route = '/app-main-screen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.mainScreen),
      ),
      body: Center(
        child: TextButton(
          onPressed: () async {
            await ref.read(signInControllerProvider.notifier).logOut();
            context.go(MyHomePage.route);
          },
          child: const Text(AppStrings.logOut),
        ),
      ),
    );
  }
}

import 'package:cheapp_and_tasty/extensions/build_context_extension.dart';
import 'package:cheapp_and_tasty/features/auth/state/sign_in_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});
  static const String route = '/';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.tr.appBarTitle,
        ),
      ),
      body: Center(
        child: TextButton(
          onPressed: () async {
            await ref.read(signInControllerProvider.notifier).logOut(context);
          },
          child: Text(context.tr.logOut),
        ),
      ),
    );
  }
}

import 'package:cheapp_and_tasty/extensions/build_context_extension.dart';
import 'package:cheapp_and_tasty/features/auth/state/sign_in_controller.dart';
import 'package:cheapp_and_tasty/features/bottom_navigation/widgets/bottom_navigation_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({required this.child, super.key});
  static const String route = '/';

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async =>
                ref.read(signInControllerProvider.notifier).logOut(context),
            icon: const Icon(Icons.logout),
          )
        ],
        title: Text(
          context.tr.appBarTitle,
        ),
      ),
      body: child,
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}

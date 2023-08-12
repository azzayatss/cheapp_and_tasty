import 'package:cheapp_and_tasty/config/app_layouts.dart';
import 'package:cheapp_and_tasty/extensions/build_context_extension.dart';
import 'package:cheapp_and_tasty/features/auth/controllers/sign_in_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  static const route = '/settings';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(AppLayouts.defaultPadding),
              child: Card(
                child: TextButton.icon(
                  onPressed: () async => ref
                      .read(signInControllerProvider.notifier)
                      .logOut(context),
                  icon: const Icon(Icons.logout),
                  label: Text(
                    context.tr.logOut,
                    style: context.textTheme.headlineSmall,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

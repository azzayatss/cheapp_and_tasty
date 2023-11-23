import 'package:cheapp_and_tasty/config/app_layouts.dart';
import 'package:cheapp_and_tasty/extensions/build_context_extension.dart';
import 'package:cheapp_and_tasty/features/auth/controllers/sign_in_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GoogleSignInCard extends ConsumerWidget {
  const GoogleSignInCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(signInControllerProvider.notifier);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppLayouts.defaultPadding),
        child: Column(
          children: [
            Text(
              context.tr.googleLogInHint,
            ),
            const SizedBox(
              height: AppLayouts.defaultPadding,
            ),
            SignInButton(
              Buttons.GoogleDark,
              onPressed: () async {
                await provider.loginWithGoogle(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:cheapp_and_tasty/config/app_layouts.dart';
import 'package:cheapp_and_tasty/extensions/build_context_extension.dart';
import 'package:cheapp_and_tasty/features/auth/controllers/sign_in_controller.dart';
import 'package:cheapp_and_tasty/features/auth/services/show_alert_for_user.dart';
import 'package:cheapp_and_tasty/features/auth/widgets/sign_in_form.dart';
import 'package:cheapp_and_tasty/features/auth/widgets/sign_up_form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthGateScreen extends ConsumerWidget {
  const AuthGateScreen({super.key});

  static const String route = '/sign-in';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(signInControllerProvider, (previous, next) {
      next.maybeWhen(
        orElse: () {},
        error: (e, _) {
          if (e is FirebaseAuthException) {
            showAlertForUser(context, e.code, e.message);
          }
        },
      );
    });
    final signInController = ref.watch(signInControllerProvider);

    return Scaffold(
      body: signInController.isLoading
          ? const Center(child: CircularProgressIndicator.adaptive())
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(AppLayouts.defaultPadding),
                child: DefaultTabController(
                  length: 2,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TabBar(
                        tabs: [
                          Tab(text: context.tr.signIn),
                          Tab(text: context.tr.signUp),
                        ],
                      ),
                      const Expanded(
                        child: TabBarView(
                          children: [
                            SignInForm(),
                            SignUpForm(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}

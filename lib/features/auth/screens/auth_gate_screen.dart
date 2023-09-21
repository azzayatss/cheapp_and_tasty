import 'package:cheapp_and_tasty/config/app_layouts.dart';
import 'package:cheapp_and_tasty/extensions/build_context_extension.dart';
import 'package:cheapp_and_tasty/features/auth/controllers/sign_in_controller.dart';
import 'package:cheapp_and_tasty/features/auth/services/show_snack_bar_for_user.dart';
import 'package:cheapp_and_tasty/features/auth/widgets/google_sign_in_card.dart';
import 'package:cheapp_and_tasty/features/auth/widgets/logo_text_container.dart';
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
            showSnackBarForUser(
              context: context,
              errorTitle: e.code,
              errorMessage: e.message,
            );
          }
        },
      );
    });
    final signInController = ref.watch(signInControllerProvider);

    if (signInController.isLoading) {
      return const Center(child: CircularProgressIndicator.adaptive());
    }
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppLayouts.defaultPadding),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DefaultTabController(
                  length: 2,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxHeight: 810,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          height: AppLayouts.defaultPadding * 2,
                        ),
                        const LogoTextContainer(),
                        const SizedBox(
                          height: AppLayouts.defaultPadding * 2,
                        ),
                        TabBar(
                          tabs: [
                            Tab(text: context.tr.signIn),
                            Tab(text: context.tr.signUp),
                          ],
                        ),
                        const Flexible(
                          child: TabBarView(
                            children: [
                              SignInForm(),
                              SignUpForm(),
                            ],
                          ),
                        ),
                        const GoogleSignInCard(),
                      ],
                    ),
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

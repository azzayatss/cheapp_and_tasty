import 'package:cheapp_and_tasty/config/app_layouts.dart';
import 'package:cheapp_and_tasty/config/app_strings.dart';
import 'package:cheapp_and_tasty/features/auth/state/sign_in_controller.dart';
import 'package:cheapp_and_tasty/features/auth/widgets/google_sign_in_card.dart';
import 'package:cheapp_and_tasty/features/auth/widgets/reset_password_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignInForm extends HookWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final obscureText = useState(true);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(AppLayouts.defaultPadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: AppLayouts.spacer / 2,
              ),
              const Text(
                AppStrings.signInEmoji,
                style: TextStyle(fontSize: AppLayouts.emojiSize),
              ),
              const SizedBox(
                height: AppLayouts.defaultPadding,
              ),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: AppStrings.emailFormHint,
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: AppLayouts.defaultPadding,
              ),
              TextFormField(
                controller: passwordController,
                obscureText: obscureText.value,
                decoration: InputDecoration(
                  hintText: AppStrings.passwordFormHint,
                  suffixIcon: IconButton(
                    icon: Icon(
                      obscureText.value
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                    ),
                    onPressed: () => obscureText.value = !obscureText.value,
                  ),
                ),
                keyboardType: TextInputType.visiblePassword,
              ),
              const SizedBox(
                height: AppLayouts.defaultPadding,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  child: const Text(AppStrings.forgotPassword),
                  onPressed: () => _dialogBuilder(context),
                ),
              ),
              const SizedBox(
                height: AppLayouts.defaultPadding,
              ),
              Consumer(
                builder: (context, ref, child) {
                  return FilledButton(
                    child: const Text(AppStrings.signIn),
                    onPressed: () => ref
                        .read(signInControllerProvider.notifier)
                        .signInWithEmail(
                          emailController.text,
                          passwordController.text,
                          context,
                        ),
                  );
                },
              ),
              const SizedBox(
                height: AppLayouts.defaultPadding * 2,
              ),
              const GoogleSignInCard(),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _dialogBuilder(
    BuildContext context,
  ) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return const ResetPasswordDialog();
      },
    );
  }
}

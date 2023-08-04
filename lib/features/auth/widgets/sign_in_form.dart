import 'package:cheapp_and_tasty/config/app_layouts.dart';
import 'package:cheapp_and_tasty/config/app_strings.dart';
import 'package:cheapp_and_tasty/features/auth/state/sign_in_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loader_overlay/loader_overlay.dart';

class SignInForm extends HookWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final obscureText = useState(true);
    return Column(
      children: [
        const SizedBox(
          height: AppLayouts.spacer,
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
            filled: true,
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
            filled: true,
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
        const SizedBox(
          height: AppLayouts.defaultPadding,
        ),
        Consumer(
          builder: (context, ref, child) {
            final signInProcess = ref.watch(signInControllerProvider);
            signInProcess.isLoading
                ? context.loaderOverlay.show()
                : context.loaderOverlay.hide();
            return Column(
              children: [
                FilledButton(
                  onPressed: signInProcess.isLoading
                      ? null
                      : () {
                          ref.read(signInControllerProvider.notifier).signIn(
                                emailController.text,
                                passwordController.text,
                              );
                        },
                  child: const Text(AppStrings.signIn),
                ),
                FilledButton(
                  onPressed: signInProcess.isLoading
                      ? null
                      : () async {
                          await ref
                              .read(signInControllerProvider.notifier)
                              .loginWithGoogle();
                        },
                  child: const Text('google'),
                ),
                SignInButton(
                  Buttons.GoogleDark,
                  onPressed: () => signInProcess.isLoading
                      ? null
                      : () async {
                          await ref
                              .read(signInControllerProvider.notifier)
                              .loginWithGoogle();
                        },
                ),
                if (signInProcess.hasError) ...[
                  const SizedBox(height: AppLayouts.defaultPadding),
                  const Text('Something went wrong')
                ]
              ],
            );
          },
        ),
        const SizedBox(
          height: AppLayouts.defaultPadding,
        ),
        const SizedBox(
          height: AppLayouts.spacer,
        ),
      ],
    );
  }
}
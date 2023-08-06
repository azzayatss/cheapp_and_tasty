import 'package:cheapp_and_tasty/config/app_layouts.dart';
import 'package:cheapp_and_tasty/config/app_strings.dart';
import 'package:cheapp_and_tasty/features/auth/state/sign_in_controller.dart';
import 'package:cheapp_and_tasty/features/auth/widgets/google_sign_in_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loader_overlay/loader_overlay.dart';

class SignInForm extends HookConsumerWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signInProcess = ref.watch(signInControllerProvider);
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final obscureText = useState(true);
    return LoaderOverlay(
      overlayOpacity: 0.2,
      child: SafeArea(
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
                  height: AppLayouts.defaultPadding * 2,
                ),
                FilledButton(
                  onPressed: signInProcess.isLoading
                      ? null
                      : () {
                          ref
                              .read(signInControllerProvider.notifier)
                              .signInWithEmail(
                                emailController.text,
                                passwordController.text,
                              );
                        },
                  child: const Text(AppStrings.signIn),
                ),
                const SizedBox(
                  height: AppLayouts.defaultPadding * 2,
                ),
                const GoogleSignInCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

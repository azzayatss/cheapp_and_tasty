import 'package:cheapp_and_tasty/auth/pages/sign_up_page.dart';
import 'package:cheapp_and_tasty/auth/state/auth_state.dart';
import 'package:cheapp_and_tasty/config/app_layouts.dart';
import 'package:cheapp_and_tasty/config/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignInPage extends HookWidget {
  SignInPage({super.key});

  static const String route = '/sign-in';

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final obscureText = useState(true);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
          ),
          onPressed: () {
            context.go('/');
          },
        ),
        title: const Text(AppStrings.signIn),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppLayouts.defaultPadding),
          child: Column(
            children: [
              const Spacer(),
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
              const SizedBox(
                height: AppLayouts.defaultPadding,
              ),
              Consumer(
                builder: (context, ref, child) {
                  final signInProcess = ref.watch(signInControllerProvider);
                  return Column(
                    children: [
                      FilledButton(
                        onPressed: signInProcess.isLoading
                            ? null
                            : () {
                                ref
                                    .read(signInControllerProvider.notifier)
                                    .signIn(
                                      emailController.text,
                                      passwordController.text,
                                    );
                              },
                        child: signInProcess.isLoading
                            ? const CircularProgressIndicator.adaptive()
                            : const Text(AppStrings.signIn),
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
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(AppStrings.dontHaveAccount),
                  TextButton(
                    child: const Text(AppStrings.signUp),
                    onPressed: () {
                      context.go(SignUpPage.route);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

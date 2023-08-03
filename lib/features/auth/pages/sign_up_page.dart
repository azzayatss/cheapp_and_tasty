import 'package:cheapp_and_tasty/config/app_layouts.dart';
import 'package:cheapp_and_tasty/config/app_strings.dart';
import 'package:cheapp_and_tasty/features/auth/pages/sign_in_page.dart';
import 'package:cheapp_and_tasty/features/auth/state/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loader_overlay/loader_overlay.dart';

class SignUpPage extends HookWidget {
  const SignUpPage({super.key});

  static const String route = '/sign-up';

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final nameController = useTextEditingController();
    final surnameController = useTextEditingController();
    final obscureText = useState(true);
    final termsAndConditions = useState(true);
    final newsSubscription = useState(true);
    return LoaderOverlay(
      overlayOpacity: 0.2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.signUp),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
            ),
            onPressed: () {
              context.go('/');
            },
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppLayouts.defaultPadding),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: AppLayouts.spacer / 2,
                  ),
                  const Text(
                    AppStrings.signUpEmoji,
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
                  TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      filled: true,
                      hintText: AppStrings.nameFormHint,
                    ),
                  ),
                  const SizedBox(
                    height: AppLayouts.defaultPadding,
                  ),
                  TextFormField(
                    controller: surnameController,
                    decoration: const InputDecoration(
                      filled: true,
                      hintText: AppStrings.surnameFormHint,
                    ),
                  ),
                  const SizedBox(
                    height: AppLayouts.defaultPadding,
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: termsAndConditions.value,
                        onChanged: (_) => termsAndConditions.value =
                            !termsAndConditions.value,
                      ),
                      GestureDetector(
                        child: const Text(
                          AppStrings.termsAndConditionsCheckBoxText,
                        ),
                        onTap: () => termsAndConditions.value =
                            !termsAndConditions.value,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: newsSubscription.value,
                        onChanged: (_) =>
                            newsSubscription.value = !newsSubscription.value,
                      ),
                      GestureDetector(
                        child: const Text(AppStrings.receiveEmails),
                        onTap: () =>
                            newsSubscription.value = !newsSubscription.value,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: AppLayouts.defaultPadding,
                  ),
                  Consumer(
                    builder: (context, ref, child) {
                      final signUpProcess = ref.watch(signInControllerProvider);
                      signUpProcess.isLoading
                          ? context.loaderOverlay.show()
                          : context.loaderOverlay.hide();
                      return FilledButton(
                        onPressed: signUpProcess.isLoading
                            ? null
                            : () {
                                ref
                                    .read(signInControllerProvider.notifier)
                                    .signUp(
                                      emailController.text,
                                      passwordController.text,
                                      nameController.text,
                                      surnameController.text,
                                    );
                              },
                        child: const Text(AppStrings.signUp),
                      );
                    },
                  ),
                  const SizedBox(
                    height: AppLayouts.defaultPadding,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(AppStrings.alreadyHaveAccount),
                      TextButton(
                        child: const Text(AppStrings.signIn),
                        onPressed: () {
                          context.go(SignInPage.route);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

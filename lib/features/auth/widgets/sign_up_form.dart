import 'package:cheapp_and_tasty/config/app_layouts.dart';
import 'package:cheapp_and_tasty/extensions/build_context_extension.dart';
import 'package:cheapp_and_tasty/features/auth/state/sign_in_controller.dart';
import 'package:cheapp_and_tasty/features/auth/widgets/google_sign_in_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignUpForm extends HookWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final obscureText = useState(true);
    final termsAndConditions = useState(true);
    final newsSubscription = useState(true);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(AppLayouts.defaultPadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: AppLayouts.spacer / 2,
              ),
              Text(
                context.tr.signUpEmoji,
                style: const TextStyle(fontSize: AppLayouts.emojiSize),
              ),
              const SizedBox(
                height: AppLayouts.defaultPadding,
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: context.tr.emailFormHint,
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
                  hintText: context.tr.passwordFormHint,
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
              Row(
                children: [
                  Checkbox(
                    value: termsAndConditions.value,
                    onChanged: (_) =>
                        termsAndConditions.value = !termsAndConditions.value,
                  ),
                  GestureDetector(
                    child: Text(
                      context.tr.termsAndConditionsCheckBoxText,
                    ),
                    onTap: () =>
                        termsAndConditions.value = !termsAndConditions.value,
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
                    child: Text(
                      context.tr.receiveEmails,
                    ),
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
                  return FilledButton(
                    onPressed: signUpProcess.isLoading
                        ? null
                        : () {
                            ref.read(signInControllerProvider.notifier).signUp(
                                  emailController.text,
                                  passwordController.text,
                                  context,
                                );
                          },
                    child: Text(context.tr.signUp),
                  );
                },
              ),
              const SizedBox(
                height: AppLayouts.defaultPadding,
              ),
              const GoogleSignInCard(),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:cheapp_and_tasty/config/app_layouts.dart';
import 'package:cheapp_and_tasty/extensions/build_context_extension.dart';
import 'package:cheapp_and_tasty/features/auth/controllers/sign_in_controller.dart';
import 'package:cheapp_and_tasty/features/auth/widgets/google_sign_in_card.dart';
import 'package:cheapp_and_tasty/features/auth/widgets/reset_password_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_validator/form_validator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignInForm extends HookWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = useMemoized(GlobalKey<FormState>.new);
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final obscureText = useState(true);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(AppLayouts.defaultPadding),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: AppLayouts.spacer / 2,
                ),
                Text(
                  context.tr.signInEmoji,
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
                  validator: ValidationBuilder()
                      .required()
                      .email()
                      .maxLength(50)
                      .build(),
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
                  validator:
                      ValidationBuilder().required().minLength(6).build(),
                ),
                const SizedBox(
                  height: AppLayouts.defaultPadding,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    child: Text(context.tr.forgotPassword),
                    onPressed: () => _dialogBuilder(context),
                  ),
                ),
                const SizedBox(
                  height: AppLayouts.defaultPadding,
                ),
                Consumer(
                  builder: (context, ref, child) {
                    return FilledButton(
                      child: Text(context.tr.signIn),
                      onPressed: () {
                        if (formKey.currentState?.validate() ?? false) {
                          ref
                              .read(signInControllerProvider.notifier)
                              .signInWithEmail(
                                emailController.text,
                                passwordController.text,
                                context,
                              );
                        }
                        return;
                      },
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

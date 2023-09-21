import 'package:cheapp_and_tasty/config/app_layouts.dart';
import 'package:cheapp_and_tasty/extensions/build_context_extension.dart';
import 'package:cheapp_and_tasty/features/auth/controllers/sign_in_controller.dart';
import 'package:cheapp_and_tasty/features/auth/widgets/reset_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_validator/form_validator.dart';
import 'package:go_router/go_router.dart';
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
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  label: Text(context.tr.login),
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
                  label: Text(context.tr.password),
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
                validator: ValidationBuilder().required().minLength(6).build(),
              ),
              const SizedBox(
                height: AppLayouts.defaultPadding,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  child: Text(context.tr.forgotPassword),
                  onPressed: () =>
                      context.pushNamed(ResetPasswordScreen.routeName),
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
                      final valid = formKey.currentState?.validate() ?? false;
                      if (valid == true) {
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
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:cheapp_and_tasty/config/app_layouts.dart';
import 'package:cheapp_and_tasty/extensions/build_context_extension.dart';
import 'package:cheapp_and_tasty/features/auth/controllers/sign_in_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_validator/form_validator.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ResetPasswordScreen extends HookConsumerWidget {
  const ResetPasswordScreen({
    super.key,
  });

  static const route = 'forgot_password';
  static const routeName = 'forgot_password';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(GlobalKey<FormState>.new);
    final emailController = useTextEditingController();
    ref.listen(
      resetPasswordProvider,
      (previous, next) {
        switch (next) {
          case AsyncError():
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(next.error.toString()),
              ),
            );
            return;

          case AsyncData():
            if (next.valueOrNull case final completed?) {
              if (completed) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('email was sent'),
                  ),
                );
                context.pop();
              }
              return;
            }
        }
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr.forgotPassword),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppLayouts.defaultPadding),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(AppLayouts.defaultPadding),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Form(
                    key: formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          context.tr.forgotPasswordDialogContent1,
                        ),
                        const SizedBox(
                          height: AppLayouts.defaultPadding,
                        ),
                        Text(
                          context.tr.forgotPasswordDialogContent2,
                        ),
                        const SizedBox(
                          height: AppLayouts.defaultPadding,
                        ),
                        Text(
                          context.tr.forgotPasswordDialogContent3,
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
                          validator: ValidationBuilder().email().build(),
                        ),
                        TextButton(
                          child: Text(context.tr.resetPassword),
                          onPressed: () {
                            final valid =
                                formKey.currentState?.validate() ?? false;
                            if (valid == true) {
                              ref
                                  .read(resetPasswordProvider.notifier)
                                  .resetPassword(emailController.text);
                            }
                          },
                        ),
                      ],
                    ),
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

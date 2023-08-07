import 'package:cheapp_and_tasty/config/app_layouts.dart';
import 'package:cheapp_and_tasty/config/app_strings.dart';
import 'package:cheapp_and_tasty/features/auth/state/sign_in_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ResetPasswordDialog extends HookWidget {
  const ResetPasswordDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    return AlertDialog(
      title: const Text(AppStrings.forgotPassword),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            AppStrings.forgotPasswordDialogContent1,
          ),
          const SizedBox(
            height: AppLayouts.defaultPadding,
          ),
          const Text(
            AppStrings.forgotPasswordDialogContent2,
          ),
          const SizedBox(
            height: AppLayouts.defaultPadding,
          ),
          const Text(
            AppStrings.forgotPasswordDialogContent3,
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
        ],
      ),
      actions: <Widget>[
        Consumer(
          builder: (context, ref, child) {
            return TextButton(
              child: const Text(AppStrings.resetPassword),
              onPressed: () async {
                await ref
                    .read(signInControllerProvider.notifier)
                    .resetPassword(emailController.text, context);

                //Don't use 'BuildContext's across async gaps.
                if (context.mounted) context.pop();
              },
            );
          },
        )
      ],
    );
  }
}

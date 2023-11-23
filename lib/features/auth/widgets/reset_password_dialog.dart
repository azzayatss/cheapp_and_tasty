import 'package:cheapp_and_tasty/config/app_layouts.dart';
import 'package:cheapp_and_tasty/extensions/build_context_extension.dart';
import 'package:cheapp_and_tasty/features/auth/controllers/sign_in_controller.dart';
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
      title: Text(context.tr.forgotPassword),
      content: Column(
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
          ),
        ],
      ),
      actions: <Widget>[
        Consumer(
          builder: (context, ref, child) {
            return TextButton(
              child: Text(context.tr.resetPassword),
              onPressed: () async {
                await ref
                    .read(signInControllerProvider.notifier)
                    .resetPassword(emailController.text, context);

                //Don't use 'BuildContext's across async gaps.
                if (context.mounted) context.pop();
              },
            );
          },
        ),
      ],
    );
  }
}

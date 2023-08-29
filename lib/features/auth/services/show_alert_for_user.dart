import 'package:cheapp_and_tasty/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future<dynamic> showAlertForUser(
  BuildContext context,
  String errorTitle,
  String? errorMessage,
) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(errorTitle),
        content: Text(errorMessage ?? ''),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text(context.tr.okButtonLabel),
          ),
        ],
      );
    },
  );
}

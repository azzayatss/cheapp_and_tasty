import 'package:cheapp_and_tasty/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';

class FormSaveButton extends StatelessWidget {
  const FormSaveButton({required this.onPressed, super.key});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      child: Text(context.tr.save),
    );
  }
}

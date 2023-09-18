import 'package:cheapp_and_tasty/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';

class PickImageButton extends StatelessWidget {
  const PickImageButton({required this.onPressed, super.key});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton.icon(
        onPressed: onPressed,
        icon: const Icon(Icons.image_outlined),
        label: Text(context.tr.uploadPhotoLabel),
      ),
    );
  }
}

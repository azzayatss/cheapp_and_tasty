import 'package:cheapp_and_tasty/config/app_layouts.dart';
import 'package:cheapp_and_tasty/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';

class SettingsMenuItemCard extends StatelessWidget {
  const SettingsMenuItemCard({
    required this.onTap,
    required this.leadingIcon,
    required this.menuItemText,
    super.key,
  });

  final void Function()? onTap;
  final IconData leadingIcon;
  final String menuItemText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(AppLayouts.defaultPadding / 2),
          child: Row(
            children: [
              const SizedBox(
                width: AppLayouts.defaultPadding,
              ),
              Icon(leadingIcon),
              const SizedBox(
                width: AppLayouts.defaultPadding,
              ),
              Text(
                menuItemText,
                style: context.textTheme.titleLarge,
              ),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ),
    );
  }
}

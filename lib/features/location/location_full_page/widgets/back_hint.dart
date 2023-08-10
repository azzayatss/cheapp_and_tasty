import 'package:cheapp_and_tasty/config/app_layouts.dart';
import 'package:cheapp_and_tasty/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BackHint extends StatelessWidget {
  const BackHint({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pop(),
      child: Row(
        children: [
          const Icon(
            Icons.arrow_back_ios_new,
            size: 11,
          ),
          const SizedBox(
            width: AppLayouts.defaultPadding / 2,
          ),
          Text(
            context.tr.systemBack,
            style: context.textTheme.labelSmall,
          ),
        ],
      ),
    );
  }
}

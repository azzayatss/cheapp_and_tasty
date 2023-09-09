import 'package:cheapp_and_tasty/config/app_layouts.dart';
import 'package:cheapp_and_tasty/extensions/build_context_extension.dart';
import 'package:cheapp_and_tasty/features/auth/controllers/sign_in_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingsUserCard extends HookConsumerWidget {
  const SettingsUserCard({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(signInControllerProvider);

    return user.when(
      data: (data) {
        final userName = useState<String>('');
        final userEmail = useState<String>('');
        final userPhotoUrl = useState<String>('');

        if (data != null) {
          userName.value = data.displayName ?? '';
          userEmail.value = data.email ?? '';
          userPhotoUrl.value = data.photoURL ?? '';
        }

        return Card(
          child: Padding(
            padding: const EdgeInsets.all(AppLayouts.defaultPadding),
            child: Row(
              children: [
                Expanded(
                  child: CircleAvatar(
                    radius: 35,
                    child: userPhotoUrl.value.isNotEmpty
                        ? Image.network(
                            userPhotoUrl.value,
                            fit: BoxFit.contain,
                          )
                        //TODO azzayats: bug - when guest user photo always progressing
                        : const CircularProgressIndicator.adaptive(),
                  ),
                ),
                const SizedBox(
                  width: AppLayouts.defaultPadding,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userName.value.isNotEmpty
                          ? userName.value
                          : context.tr.unknownUser,
                      style: context.textTheme.headlineSmall,
                    ),
                    Text(
                      userEmail.value.isNotEmpty
                          ? userEmail.value
                          : context.tr.unknownUser,
                      style: context.textTheme.bodyMedium,
                    ),
                  ],
                ),
                const Spacer(),
                const Icon(Icons.arrow_forward_ios),
              ],
            ),
          ),
        );
      },
      error: (error, _) => Center(
        child: Text(error.toString()),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }
}

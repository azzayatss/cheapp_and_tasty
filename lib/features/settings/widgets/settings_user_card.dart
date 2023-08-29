import 'package:cheapp_and_tasty/config/app_layouts.dart';
import 'package:cheapp_and_tasty/extensions/build_context_extension.dart';
import 'package:cheapp_and_tasty/features/location/location_full_page/widgets/image_place_holder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SettingsUserCard extends HookWidget {
  const SettingsUserCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final userName = useState<String>('');
    final userEmail = useState<String>('');
    final userPhotoUrl = useState<String>('');
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        userName.value = user.displayName ?? '';
        userEmail.value = user.email ?? '';
        userPhotoUrl.value = user.photoURL ?? '';
      }
    });

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
                    : const ImagePlaceHolder(),
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
  }
}

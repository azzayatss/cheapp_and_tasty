import 'package:cheapp_and_tasty/config/app_layouts.dart';
import 'package:cheapp_and_tasty/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';

class SettingsUserCard extends StatelessWidget {
  const SettingsUserCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      //todo andrii.zayats: change hardcoded data to real user data
      child: Padding(
        padding: const EdgeInsets.all(AppLayouts.defaultPadding),
        child: Row(
          children: [
            Expanded(
              child: CircleAvatar(
                radius: 35,
                child: Image.network(
                  'https://freepngimg.com/thumb/youtube/63841-profile-twitch-youtube-avatar-discord-free-download-image.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(
              width: AppLayouts.defaultPadding,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Andrii Zayats',
                  style: context.textTheme.headlineSmall,
                ),
                Text(
                  'andrew.zajats@gmail.com',
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

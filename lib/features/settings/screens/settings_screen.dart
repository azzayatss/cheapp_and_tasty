import 'package:cheapp_and_tasty/config/app_layouts.dart';
import 'package:cheapp_and_tasty/extensions/build_context_extension.dart';
import 'package:cheapp_and_tasty/features/auth/controllers/sign_in_controller.dart';
import 'package:cheapp_and_tasty/features/settings/screens/app_theme_mode_screen.dart';
import 'package:cheapp_and_tasty/features/settings/widgets/settings_menu_item_card.dart';
import 'package:cheapp_and_tasty/features/settings/widgets/settings_user_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';



class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  static const route = '/settings';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.tr.navigationBarLabel3),
        ),
        body: Padding(
          padding: const EdgeInsets.all(AppLayouts.defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SettingsUserCard(),
              const SizedBox(
                height: AppLayouts.defaultPadding * 2,
              ),
              SettingsMenuItemCard(
                onTap: () {
                  context.goNamed(AppThemeModeScreen.routeName);
                },
                leadingIcon: Icons.brightness_6_outlined,
                menuItemText: context.tr.appTheme,
              ),
              SettingsMenuItemCard(
                onTap: () async =>
                    ref.read(signInControllerProvider.notifier).logOut(context),
                leadingIcon: Icons.logout,
                menuItemText: context.tr.logOut,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

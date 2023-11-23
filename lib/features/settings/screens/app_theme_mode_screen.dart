import 'package:cheapp_and_tasty/config/app_layouts.dart';
import 'package:cheapp_and_tasty/config/theme/controllers/theme_mode_controller.dart';
import 'package:cheapp_and_tasty/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppThemeModeScreen extends ConsumerWidget {
  const AppThemeModeScreen({super.key});
  static const route = 'appearance';
  static const routeName = 'appearance';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.tr.appTheme),
        ),
        body: Padding(
          padding: const EdgeInsets.all(AppLayouts.defaultPadding),
          child: ListView.builder(
            itemCount: ThemeMode.values.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: _onTap(themeMode: ThemeMode.values[index], ref: ref),
                child: Card(
                  child: Padding(
                    padding:
                        const EdgeInsets.all(AppLayouts.defaultPadding / 3),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: AppLayouts.defaultPadding,
                        ),
                        Icon(
                          _icon(themeMode: ThemeMode.values[index]),
                        ),
                        const SizedBox(
                          width: AppLayouts.defaultPadding,
                        ),
                        Text(
                          _text(
                            themeMode: ThemeMode.values[index],
                            context: context,
                          ),
                        ),
                        const Spacer(),
                        Icon(
                          ref.watch(themeModeControllerProvider) ==
                                  ThemeMode.values[index]
                              ? Icons.check
                              : null,
                        ),
                        const SizedBox(
                          width: AppLayouts.defaultPadding,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  String _text({required ThemeMode themeMode, required BuildContext context}) {
    return switch (themeMode) {
      ThemeMode.system => context.tr.systemTheme,
      ThemeMode.light => context.tr.lightTheme,
      ThemeMode.dark => context.tr.darkTheme
    };
  }

  void Function()? _onTap({
    required ThemeMode themeMode,
    required WidgetRef ref,
  }) {
    return switch (themeMode) {
      ThemeMode.system =>
        ref.read(themeModeControllerProvider.notifier).switchToSystemTheme,
      ThemeMode.light =>
        ref.read(themeModeControllerProvider.notifier).switchToLightTheme,
      ThemeMode.dark =>
        ref.read(themeModeControllerProvider.notifier).switchToDarkTheme,
    };
  }

  IconData? _icon({
    required ThemeMode themeMode,
  }) {
    return switch (themeMode) {
      ThemeMode.system => Icons.system_security_update_good,
      ThemeMode.light => Icons.light_mode_outlined,
      ThemeMode.dark => Icons.dark_mode_outlined,
    };
  }
}

import 'package:cheapp_and_tasty/config/router/go_router_config.dart';
import 'package:cheapp_and_tasty/config/theme.dart';
import 'package:cheapp_and_tasty/l10n/all_locales.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AllLocales.all,
      theme: AppTheme().themeData,
      routerConfig: ref.watch(routerProvider),
    );
  }
}

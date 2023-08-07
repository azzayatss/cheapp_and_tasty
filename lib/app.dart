import 'package:cheapp_and_tasty/config/router/go_router_config.dart';
import 'package:cheapp_and_tasty/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      theme: AppTheme().themeData,
      routerConfig: ref.watch(routerProvider),
    );
  }
}

import 'package:cheapp_and_tasty/features/bottom_navigation/widgets/bottom_navigation_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainScaffoldScreen extends ConsumerWidget {
  const MainScaffoldScreen({required this.child, super.key});
  static const String route = '/';

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: child,
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}

import 'package:cheapp_and_tasty/config/app_layouts.dart';
import 'package:cheapp_and_tasty/extensions/build_context_extension.dart';
import 'package:cheapp_and_tasty/features/location/controllers/global_location_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  static const route = '/home';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locationsNumber =
        ref.watch(globalLocationsListControllerProvider).length;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.tr.navigationBarLabel0),
        ),
        body: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(AppLayouts.defaultPadding),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(AppLayouts.defaultPadding),
                      child: Column(
                        children: [
                          Text(context.tr.locationsNumber),
                          Text('$locationsNumber'),
                        ],
                      ),
                    ),
                  ),
                ),
                const Card(
                  child: Column(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

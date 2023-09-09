import 'package:cheapp_and_tasty/config/app_layouts.dart';
import 'package:cheapp_and_tasty/config/theme/app_colors.dart';
import 'package:cheapp_and_tasty/extensions/build_context_extension.dart';
import 'package:cheapp_and_tasty/features/location/locations_listing/controllers/location_list_controller.dart';
import 'package:cheapp_and_tasty/features/map/widgets/map_marker_info_window_card.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  static const route = '/home';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.watch(locationListControllerProvider);

    return list.when(
      data: (data) {
        final locationsNumber = data.length;
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text(context.tr.navigationBarLabel0),
            ),
            body: Padding(
              padding: const EdgeInsets.all(AppLayouts.defaultPadding),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Card(
                      child: Padding(
                        padding:
                            const EdgeInsets.all(AppLayouts.defaultPadding),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              context.tr.locationsNumber,
                              style: context.textTheme.titleLarge,
                            ),
                            Text(
                              '$locationsNumber',
                              style: context.textTheme.headlineMedium!
                                  .copyWith(color: AppColors.appSeedColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: AppLayouts.defaultPadding,
                    ),
                    Text(
                      '🎉 ${context.tr.lastAddedLocation}',
                      style: context.textTheme.titleLarge,
                    ),
                    //TODO azzayas: bug - повертає не останній доданий а останній в списку
                    MapMarkerInfoWindowCard(location: data.last),
                  ],
                ),
              ),
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

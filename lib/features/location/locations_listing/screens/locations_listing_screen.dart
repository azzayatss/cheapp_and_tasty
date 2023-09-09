import 'package:cheapp_and_tasty/config/app_layouts.dart';
import 'package:cheapp_and_tasty/extensions/build_context_extension.dart';
import 'package:cheapp_and_tasty/features/location/add_location/screens/add_new_location_screen.dart';
import 'package:cheapp_and_tasty/features/location/location_full_page/screeens/location_full_screen.dart';
import 'package:cheapp_and_tasty/features/location/locations_listing/controllers/location_list_controller.dart';
import 'package:cheapp_and_tasty/features/location/locations_listing/widgets/location_listing_card.dart';
import 'package:cheapp_and_tasty/features/map/controllers/current_location_controller.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LocationsListScreen extends ConsumerWidget {
  const LocationsListScreen({super.key});

  static const route = '/list';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loadMap = ref.watch(loadMapRefProvider);

    return loadMap.when(
      data: (data) {
        final currentPosition =
            ref.watch(currentLocationControllerProvider).valueOrNull;
        final list = ref.watch(locationListControllerProvider);

        return list.when(
          data: (list) {
            return SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  title: Text(context.tr.navigationBarLabel2),
                ),
                body: Stack(
                  children: [
                    if (list.isEmpty)
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              context.tr.noLocationsToDisplay,
                            ),
                          ),
                          const SizedBox(
                            height: AppLayouts.defaultPadding,
                          ),
                          IconButton(
                            onPressed: () => ref.refresh(
                              locationListControllerProvider,
                            ),
                            icon: const Icon(Icons.refresh),
                          ),
                        ],
                      )
                    else
                      //TODO azzayats: this thing can be redone with streams so we will not need refreshing at all.
                      RefreshIndicator(
                        onRefresh: () =>
                            ref.refresh(locationListControllerProvider.future),
                        child: ListView.builder(
                          itemCount: list.length,
                          itemBuilder: (context, index) {
                            final item = list[index];
                            return Padding(
                              padding: const EdgeInsets.fromLTRB(
                                AppLayouts.defaultPadding,
                                AppLayouts.defaultPadding,
                                AppLayouts.defaultPadding,
                                0,
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  context.goNamed(
                                    LocationFullScreen.routeName,
                                    pathParameters: {
                                      'locationId': item.locationId,
                                    },
                                  );
                                },
                                child: LocationListingCard(
                                  item: item,
                                  currentPosition: currentPosition,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    Positioned(
                      right: AppLayouts.defaultPadding,
                      bottom: AppLayouts.defaultPadding,
                      child: FloatingActionButton(
                        child: const Icon(Icons.add),
                        onPressed: () {
                          context.goNamed(AddNewLocationScreen.routeName);
                        },
                      ),
                    ),
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

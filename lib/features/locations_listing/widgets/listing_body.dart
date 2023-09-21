import 'package:cheapp_and_tasty/config/app_layouts.dart';
import 'package:cheapp_and_tasty/config/constants/app_constants.dart';
import 'package:cheapp_and_tasty/extensions/build_context_extension.dart';
import 'package:cheapp_and_tasty/features/location/entities/location_entity.dart';
import 'package:cheapp_and_tasty/features/location_full_page/screens/location_full_screen.dart';
import 'package:cheapp_and_tasty/features/locations_listing/controllers/get_distance_to_location_controller.dart';
import 'package:cheapp_and_tasty/features/locations_listing/controllers/location_list_controller.dart';
import 'package:cheapp_and_tasty/features/locations_listing/enums/sort_options.dart';
import 'package:cheapp_and_tasty/features/locations_listing/widgets/location_listing_card.dart';
import 'package:cheapp_and_tasty/features/map/controllers/current_location_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ListingBody extends HookConsumerWidget {
  const ListingBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final finalList = useState<List<LocationEntity>>([]);

    final selectedChips = ref.watch(filterChipsControllerProvider);

    final searchRequest = ref.watch(searchBarStateControllerProvider);

    final currentPosition =
        ref.watch(currentLocationControllerProvider).valueOrNull;

    final filteredList =
        ref.watch(filteredLocationsListProvider(searchRequest, selectedChips));

    final sort = ref.watch(sortedValueProvider);

    return filteredList.when(
      data: (list) {
        final distancesList = ref.watch(
          getLocationWithDistanceRecordListProvider(
            currentPositionLatitude:
                currentPosition?.latitude ?? AppConstants.lvivLatitude,
            currentPositionLongitude:
                currentPosition?.longitude ?? AppConstants.lvivLongitude,
            locations: list,
          ),
        );

        if (sort == SortOptions.unsorted) {
          finalList.value = list;
        }

        if (sort == SortOptions.byRate) {
          finalList.value = list
            ..sort(
              (a, b) => b.averageRate.compareTo(a.averageRate),
            );
        }

        if (sort == SortOptions.byDistance) {
          distancesList.when(
            data: (data) {
              final sortedListWithDistances = data
                ..sort(
                  (a, b) => (a.distanceToLocation ?? 0.0)
                      .compareTo(b.distanceToLocation ?? 0.0),
                );

              final sortedList = <LocationEntity>[];

              for (var i = 0; i < sortedListWithDistances.length; i++) {
                final location = sortedListWithDistances[i].location;
                sortedList.add(location);
              }

              finalList.value = sortedList;
            },
            error: (error, _) => Center(
              child: Text(error.toString()),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          );

          // final listWithDistances =
          //     <({double distanceToLocation, LocationEntity location})>[];
          // for (var i = 0; i < list.length; i++) {
          //   final location = list[i];

          //   final distanceAndDuration = ref
          //       .watch(
          //         distanceToLocationProvider(
          //           currentPositionLatitude:
          //               currentPosition?.latitude ?? AppConstants.lvivLatitude,
          //           currentPositionLongitude: currentPosition?.longitude ??
          //               AppConstants.lvivLongitude,
          //           locationLatitude: location.locationLatitude,
          //           locationLongitude: location.locationLongitude,
          //         ),
          //       )
          //       .valueOrNull;

          //   final cleanedString =
          //       distanceAndDuration?[0].replaceAll(RegExp(r'[a-zA-Z\s]'), '');

          //   final distanceInkm = double.tryParse(cleanedString ?? '0.0');

          //   final locationAndDistanceRecord =
          //       (location: location, distanceToLocation: distanceInkm!);

          //   listWithDistances.add(locationAndDistanceRecord);
          // }

          // ref
          //     .read(locationsAndDistancesListProvider.notifier)
          //     .update(listWithDistances);

          // final sortedListWithDistances = listWithDistances
          //   ..sort(
          //     (a, b) => a.distanceToLocation.compareTo(b.distanceToLocation),
          //   );

          // final sortedList = <LocationEntity>[];

          // for (var i = 0; i < sortedListWithDistances.length; i++) {
          //   final location = sortedListWithDistances[i].location;
          //   sortedList.add(location);
          // }

          // finalList.value = sortedList;
        }

        return RefreshIndicator(
          onRefresh: () => ref.refresh(locationListControllerProvider.future),
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              minHeight: 200,
              maxHeight: 550,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (list.isEmpty) ...[
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
                ] else
                  //TODO azzayats: this thing can be redone with streams so we will not need refreshing at all.
                  //TODO azzayatss: bug - після того як ти користувався пошуком фокус залишається і через це сторінка не рефрешиться правлиьно (після додавання закладу - рефрещ - новий заклад не відображається.)
                  Flexible(
                    child: ListView.builder(
                      itemCount: finalList.value.length,
                      itemBuilder: (context, index) {
                        final item = finalList.value[index];
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
  }
}

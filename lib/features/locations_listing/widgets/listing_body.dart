import 'package:cheapp_and_tasty/config/app_layouts.dart';
import 'package:cheapp_and_tasty/extensions/build_context_extension.dart';
import 'package:cheapp_and_tasty/features/location_full_page/screens/location_full_screen.dart';
import 'package:cheapp_and_tasty/features/locations_listing/controllers/location_list_controller.dart';
import 'package:cheapp_and_tasty/features/locations_listing/widgets/location_listing_card.dart';
import 'package:cheapp_and_tasty/features/map/controllers/current_location_controller.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ListingBody extends ConsumerWidget {
  const ListingBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchRequest = ref.watch(searchBarStateControllerProvider);
    final currentPosition =
        ref.watch(currentLocationControllerProvider).valueOrNull;
    final filteredList =
        ref.watch(filteredLocationsListProvider(searchRequest));

    return filteredList.when(
      data: (list) {
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

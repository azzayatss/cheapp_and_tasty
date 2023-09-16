import 'package:cheapp_and_tasty/config/app_layouts.dart';
import 'package:cheapp_and_tasty/extensions/build_context_extension.dart';
import 'package:cheapp_and_tasty/features/add_location/screens/add_new_location_screen.dart';
import 'package:cheapp_and_tasty/features/location/entities/location_entity.dart';
import 'package:cheapp_and_tasty/features/location_full_page/screens/location_full_screen.dart';
import 'package:cheapp_and_tasty/features/locations_listing/controllers/location_list_controller.dart';
import 'package:cheapp_and_tasty/features/locations_listing/widgets/location_listing_card.dart';
import 'package:cheapp_and_tasty/features/map/controllers/current_location_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LocationsListScreen extends HookConsumerWidget {
  const LocationsListScreen({super.key});

  static const route = '/list';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loadMap = ref.watch(loadMapRefProvider);
    final searchController = useTextEditingController();
    final searchRequest = useState<List<LocationEntity>>([]);

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
                      //TODO azzayatss: bug - після того як ти користувався пошуком фокус залишається і через це сторінка не рефрешиться правлиьно (після додавання закладу - рефрещ - новий заклад не відображається.)
                      RefreshIndicator(
                        onRefresh: () =>
                            ref.refresh(locationListControllerProvider.future),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(
                                AppLayouts.defaultPadding,
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: TextField(
                                          controller: searchController,
                                          decoration: InputDecoration(
                                            labelText: context.tr.search,
                                            hintText: context.tr.search,
                                            prefixIcon:
                                                const Icon(Icons.search),
                                          ),
                                          onChanged: (value) {
                                            searchRequest.value = list
                                                .where(
                                                  (location) => location
                                                      .locationName
                                                      .toLowerCase()
                                                      .contains(
                                                        value.toLowerCase(),
                                                      ),
                                                )
                                                .toList();
                                          },
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.sort),
                                      ),
                                    ],
                                  ),
                                  // ListView.builder(
                                  //   scrollDirection: Axis.horizontal,
                                  //   itemBuilder: itemBuilder,
                                  // ),
                                ],
                              ),
                            ),
                            Flexible(
                              child: ListView.builder(
                                itemCount: searchRequest.value.isEmpty
                                    ? list.length
                                    : searchRequest.value.length,
                                itemBuilder: (context, index) {
                                  final item = searchRequest.value.isEmpty
                                      ? list[index]
                                      : searchRequest.value[index];
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

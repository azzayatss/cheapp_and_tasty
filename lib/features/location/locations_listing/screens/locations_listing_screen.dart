import 'package:cheapp_and_tasty/config/app_layouts.dart';
import 'package:cheapp_and_tasty/extensions/build_context_extension.dart';
import 'package:cheapp_and_tasty/features/location/controllers/global_location_list_controller.dart';
import 'package:cheapp_and_tasty/features/location/entities/location_entity.dart';
import 'package:cheapp_and_tasty/features/location/location_full_page/screeens/location_full_page_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LocationListScreen extends ConsumerWidget {
  const LocationListScreen({super.key});

  static const route = '/list';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.watch(globalLocationsListControllerProvider);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.tr.navigationBarLabel2),
        ),
        body: Stack(
          children: [
            if (list.isEmpty)
              const Center(
                child: Text(
                  'Немає закладів для відображення.',
                ),
              )
            else
              ListView.builder(
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
                          pathParameters: {'locationId': item.locationId},
                        );
                      },
                      child: Card(
                        child: ListTile(
                          title: Text(item.locationName),
                          subtitle: Text(item.locationDescription),
                        ),
                      ),
                    ),
                  );
                },
              ),
            Positioned(
              right: AppLayouts.defaultPadding,
              bottom: AppLayouts.defaultPadding,
              child: FloatingActionButton(
                child: const Icon(Icons.add),
                onPressed: () {
                  final newLocation = LocationEntity(
                    locationId: '222222',
                    locationName: 'test name2',
                    locationDescription: 'test description',
                    locationAdress: 'проспект Свободи 5',
                    locationLatitude: 10,
                    locationLongitude: 10,
                    locationWorkingSchedule:
                        'пн-пт: 10:00-17:00; сб-нд: вихідні',
                    locationReviews: 'test review',
                    locationRate: 5,
                    personWhoAddedLocation: 'andrii zajats',
                    dateTimeWhenLocationAdded: DateTime.now(),
                    doesLocationHaveDelivery: false,
                    doesLocationHaveTakeAway: false,
                    doesLocationHaveOwnParking: false,
                    doesLocationHaveCardPayments: false,
                    locationMenuImages: <String>[
                      // 'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
                      // 'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
                      // 'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
                      // 'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
                      // 'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
                      // 'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
                    ],
                    locationImages: <String>[
                      'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
                      'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
                      'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
                      'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
                      'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
                      'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
                    ],
                  );
                  ref
                      .read(globalLocationsListControllerProvider.notifier)
                      .add(newLocation);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

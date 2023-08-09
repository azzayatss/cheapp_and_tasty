import 'package:cheapp_and_tasty/config/app_layouts.dart';
import 'package:cheapp_and_tasty/features/location/controllers/location_controller.dart';
import 'package:cheapp_and_tasty/features/location/entities/location_entity.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LocationListScreen extends ConsumerWidget {
  const LocationListScreen({super.key});

  static const route = '/list';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.watch(locationListControllerProvider);
    return Stack(
      children: [
        ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            final item = list[index];
            return Padding(
              padding: const EdgeInsets.all(AppLayouts.defaultPadding),
              child: Card(
                child: ListTile(
                  title: Text(item.locationName),
                  subtitle: Text(item.locationDescription),
                ),
              ),
            );
          },
        ),
        Positioned(
          right: 10,
          bottom: 10,
          child: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              final newLocation = LocationEntity(
                locationName: 'test name123',
                locationDescription: 'test description',
                locationLatitude: 10,
                locationLongitude: 10,
                locationWorkingSchedule: 'пн-пт: 10:00-17:00; сб-нд: вихідні',
                locationReviews: 'test review',
                locationRate: 5,
                personWhoAddedLocation: 'andrii zajats',
                dateTimeWhenLocationAdded: DateTime.now(),
                doesLocationHaveDelivery: true,
                doesLocationHaveTakeAway: true,
                doesLocationHaveOwnParking: true,
                doesLocationHaveCardPayments: true,
              );
              ref
                  .read(locationListControllerProvider.notifier)
                  .add(newLocation);
            },
          ),
        )
      ],
    );
  }
}

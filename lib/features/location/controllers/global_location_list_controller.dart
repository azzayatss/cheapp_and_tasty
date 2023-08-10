import 'package:cheapp_and_tasty/features/location/entities/location_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'global_location_list_controller.g.dart';

@riverpod
class GlobalLocationsListController extends _$GlobalLocationsListController {
  @override
  List<LocationEntity> build() {
    final globalLocationsList = <LocationEntity>[
      LocationEntity(
        locationId: '1111',
        locationName: 'test name1',
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
      ),
    ];
    state = globalLocationsList;
    return globalLocationsList;
  }

  void add(LocationEntity newLocation) {
    state = [...state, newLocation];
  }
}

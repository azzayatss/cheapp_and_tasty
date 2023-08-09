import 'package:cheapp_and_tasty/features/location/entities/location_entity.dart';

List<LocationEntity> globalLocationsList = [
  LocationEntity(
    locationName: 'test name',
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

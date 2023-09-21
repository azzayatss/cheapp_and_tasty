// ({double distanceToLocation, LocationEntity location})

import 'package:cheapp_and_tasty/config/constants/app_constants.dart';
import 'package:cheapp_and_tasty/features/location/entities/location_entity.dart';
import 'package:cheapp_and_tasty/features/locations_listing/controllers/distances_list_controller.dart';
import 'package:cheapp_and_tasty/features/locations_listing/entities/distance_to_location_entity.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_distance_to_location_controller.g.dart';

@riverpod
FutureOr<List<({double? distanceToLocation, LocationEntity location})>>
    getLocationWithDistanceRecordList(
  GetLocationWithDistanceRecordListRef ref, {
  required double currentPositionLatitude,
  required double currentPositionLongitude,
  required List<LocationEntity> locations,
}) async {
  final locationWithDistanceRecordList =
      <({double? distanceToLocation, LocationEntity location})>[];

  for (var i = 0; i < locations.length; i++) {
    final locationLatitude = locations[i].locationLatitude;
    final locationLongitude = locations[i].locationLongitude;

    final response = await Dio().get<dynamic>(
      'https://maps.googleapis.com/maps/api/distancematrix/json?origins=$currentPositionLatitude%2C$currentPositionLongitude&destinations=$locationLatitude%2C$locationLongitude&units=metric&key=${AppConstants.googleMapsApiKey}',
    );
    final destination = response.data as Map<String, dynamic>;

    final distanceToLocation = DistanceToLocationEntity.fromJson(
      //TODO azzayatss pattern matching?
      destination['rows'][0]['elements'][0] as Map<String, dynamic>,
    );

    final distanceString = distanceToLocation.distance.distance;
    final clearedString = distanceString.replaceAll(RegExp(r'[a-zA-Z\s]'), '');
    final distanceToLocationDouble = double.tryParse(clearedString);

    final record =
        (location: locations[i], distanceToLocation: distanceToLocationDouble);

    locationWithDistanceRecordList.add(record);
  }

  ref
      .read(distancesListControllerProvider.notifier)
      .update(locationWithDistanceRecordList);

  return locationWithDistanceRecordList;
}

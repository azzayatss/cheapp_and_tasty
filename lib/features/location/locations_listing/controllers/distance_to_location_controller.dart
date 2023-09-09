// ignore_for_file: avoid_dynamic_calls

import 'package:cheapp_and_tasty/config/constants/app_constants.dart';
import 'package:cheapp_and_tasty/features/location/locations_listing/entities/distance_to_location_entity.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'distance_to_location_controller.g.dart';

@riverpod
FutureOr<List<String>> distanceToLocation(
  DistanceToLocationRef ref, {
  required double currentPositionLatitude,
  required double currentPositionLongitude,
  required double locationLatitude,
  required double locationLongitude,
}) async {
  final response = await Dio().get<dynamic>(
    'https://maps.googleapis.com/maps/api/distancematrix/json?origins=$currentPositionLatitude%2C$currentPositionLongitude&destinations=$locationLatitude%2C$locationLongitude&units=metric&key=${AppConstants.googleMapsApiKey}',
  );

  final destination = response.data as Map<String, dynamic>;

  final distanceToLocation = DistanceToLocationEntity.fromJson(
    //TODO azzayatss pattern matching?
    destination['rows'][0]['elements'][0] as Map<String, dynamic>,
  );
  return [
    distanceToLocation.distance.distance,
    distanceToLocation.duration.timeToLocation,
  ];
}

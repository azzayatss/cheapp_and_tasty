import 'package:cheapp_and_tasty/config/constants/app_constants.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_location_controller.g.dart';

@riverpod
class CurrentLocationController extends _$CurrentLocationController {
  @override
  LatLng build() {
    return const LatLng(
      AppConstants.defaultLatitude,
      AppConstants.defaultLongitude,
    );
  }

  void deviceCurrentLocation(LatLng devicePosition) {
    state = devicePosition;
  }
}

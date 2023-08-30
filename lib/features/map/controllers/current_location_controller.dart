import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_location_controller.g.dart';

@riverpod
class CurrentLocationController extends _$CurrentLocationController {
  @override
  LatLng build() {
    return const LatLng(
      49.84890577036393,
      24.030671653555967,
    );
  }

  void deviceCurrentLocation(LatLng devicePosition) {
    state = devicePosition;
  }
}

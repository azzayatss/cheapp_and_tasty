import 'package:cheapp_and_tasty/config/constants/app_constants.dart';
import 'package:cheapp_and_tasty/features/locations_listing/controllers/location_list_controller.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_location_controller.g.dart';

@riverpod
class CurrentLocationController extends _$CurrentLocationController {
  @override
  Future<LatLng> build() async {
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();
    // final position = await Geolocator.getCurrentPosition(
    //   desiredAccuracy: LocationAccuracy.low,
    // );
    return const LatLng(AppConstants.lvivLatitude, AppConstants.lvivLongitude);
    //TODO azzayats: uncomment to work with real device location
    // return LatLng(position.latitude, position.longitude);
  }
}

@riverpod
FutureOr<void> loadMapRef(LoadMapRefRef ref) async {
  await Future.wait<void>([
    ref.watch(currentLocationControllerProvider.future),
    ref.watch(locationListControllerProvider.future),
  ]);
}

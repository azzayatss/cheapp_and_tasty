//TODO azzayats: 6 - onboarding screens
//TODO azzayats: 8 - test otakoyi package from Eugene

import 'package:cheapp_and_tasty/config/constants/app_constants.dart';
import 'package:cheapp_and_tasty/extensions/build_context_extension.dart';
import 'package:cheapp_and_tasty/features/locations_listing/controllers/location_list_controller.dart';
import 'package:cheapp_and_tasty/features/map/controllers/current_location_controller.dart';
import 'package:cheapp_and_tasty/features/map/hooks/map_controller_hook.dart';
import 'package:cheapp_and_tasty/features/map/widgets/map_marker_info_window_card.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MapScreen extends HookConsumerWidget {
  MapScreen({super.key});
  static const route = '/map';

  final double _zoom = AppConstants.mapZoomLevel;
  final Set<Marker> _markers = {};

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loadMap = ref.watch(loadMapRefProvider);

    return loadMap.when(
      data: (data) {
        final customInfoWindowController = useCustomInfoWindowController();
        final currentPosition =
            ref.watch(currentLocationControllerProvider).valueOrNull;
        final list = ref.watch(locationListControllerProvider);

        return list.when(
          data: (data) {
            for (var i = 0; i < data.length; i++) {
              final location = data[i];
              _markers.add(
                Marker(
                  markerId: MarkerId(location.locationId),
                  position: LatLng(
                    location.locationLatitude,
                    location.locationLongitude,
                  ),
                  onTap: () {
                    customInfoWindowController.addInfoWindow!(
                      MapMarkerInfoWindowCard(location: location),
                      LatLng(
                        location.locationLatitude,
                        location.locationLongitude,
                      ),
                    );
                  },
                ),
              );
            }

            return Scaffold(
              appBar: AppBar(
                title: Text(context.tr.navigationBarLabel1),
              ),
              body: Stack(
                children: <Widget>[
                  GoogleMap(
                    onTap: (position) {
                      customInfoWindowController.hideInfoWindow!();
                    },
                    onCameraMove: (position) {
                      customInfoWindowController.onCameraMove!();
                    },
                    onMapCreated: (GoogleMapController controller) async {
                      customInfoWindowController.googleMapController =
                          controller;
                    },
                    markers: _markers,
                    initialCameraPosition: CameraPosition(
                      target: currentPosition!,
                      zoom: _zoom,
                    ),
                  ),
                  CustomInfoWindow(
                    controller: customInfoWindowController,
                    height: 200,
                    width: 400,
                  ),
                ],
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

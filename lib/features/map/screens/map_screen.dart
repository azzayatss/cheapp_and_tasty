//TODO azzayats: 2 - display the user's location when the map screen is open
//TODO azzayats: 3 - show map markers from db locations list
//TODO azzayats: 4 - implement custom info widget with view details and go to location button
//https://pub.dev/packages/custom_info_window/example
//TODO azzayats: 5 -  add geoposition to locationEntity -> google maps adress picker + adress to LatLng converter
//TODO azzayats: 6 - onboarding screens
//TODO azzayats: 7 - refactor .checkPermission() .requestPermission() ti separate controller
//TODO azzayats: 8 - test otakoyi package from Eugene

import 'dart:async';
import 'dart:developer' as dev;

import 'package:cheapp_and_tasty/extensions/build_context_extension.dart';
import 'package:cheapp_and_tasty/features/location/locations_listing/controllers/location_list_controller.dart';
import 'package:cheapp_and_tasty/features/map/controllers/current_location_controller.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MapScreen extends ConsumerStatefulWidget {
  const MapScreen({super.key});

  static const route = '/map';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MapScreenState();
}

class _MapScreenState extends ConsumerState<MapScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  @override
  void initState() {
    //TODO azzayats: uncomment line below to use real device location
    // getLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final list = ref.watch(locationListControllerProvider);
    final currentPosition = ref.watch(currentLocationControllerProvider);
    ref.listen(currentLocationControllerProvider, (previous, next) async {
      final controller = await _controller.future;
      await controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: next, zoom: 13.5),
        ),
      );
    });

    return list.when(
      data: (data) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text(context.tr.navigationBarLabel1),
            ),
            body: GoogleMap(
              myLocationEnabled: true,
              initialCameraPosition: CameraPosition(
                target: currentPosition,
                zoom: 13.5,
              ),
              onMapCreated: _controller.complete,
              markers: {
                for (var i = 0; i < data.length; i++)
                  Marker(
                    onTap: () => dev.log('tapped: ${data[i].locationName}'),
                    markerId: MarkerId(data[i].locationId),
                    position: LatLng(
                      data[i].locationLatitude,
                      data[i].locationLongitude,
                    ),
                    icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueViolet,
                    ),
                  ),
              },
            ),
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

  Future<void> getLocation() async {
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();
    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.low,
    );
    final devicePosition = LatLng(position.latitude, position.longitude);
    ref
        .read(currentLocationControllerProvider.notifier)
        .deviceCurrentLocation(devicePosition);
  }
}

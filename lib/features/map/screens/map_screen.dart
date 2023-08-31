//TODO azzayats: 2 - display the user's location when the map screen is open
//TODO azzayats: 3 - show map markers from db locations list
//TODO azzayats: 4 - implement custom info widget with view details and go to location button
//https://pub.dev/packages/custom_info_window/example
//TODO azzayats: 5 -  add geoposition to locationEntity -> google maps adress picker + adress to LatLng converter
//TODO azzayats: 6 - onboarding screens
//TODO azzayats: 7 - refactor .checkPermission() .requestPermission() ti separate controller
//TODO azzayats: 8 - test otakoyi package from Eugene

// import 'dart:async';

import 'package:cheapp_and_tasty/config/app_layouts.dart';
import 'package:cheapp_and_tasty/config/theme/app_colors.dart';
import 'package:cheapp_and_tasty/extensions/build_context_extension.dart';
import 'package:cheapp_and_tasty/features/home/screens/home_screen.dart';
import 'package:cheapp_and_tasty/features/location/location_full_page/widgets/image_place_holder.dart';
import 'package:cheapp_and_tasty/features/map/controllers/current_location_controller.dart';
import 'package:cheapp_and_tasty/features/settings/screens/settings_screen.dart';
import 'package:clippy_flutter/triangle.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MapScreen extends ConsumerStatefulWidget {
  const MapScreen({super.key});

  static const route = '/map';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MapScreenState();
}

class _MapScreenState extends ConsumerState<MapScreen> {
  final CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();

  final double _zoom = 13.5;

  @override
  void initState() {
    //TODO azzayats: uncomment line below to use real device location
    // getLocation();
    super.initState();
  }

  @override
  void dispose() {
    _customInfoWindowController.dispose();
    super.dispose();
  }

  final Set<Marker> _markers = {};

  @override
  Widget build(BuildContext context) {
    final currentPosition = ref.watch(currentLocationControllerProvider);
    _markers
      ..add(
        Marker(
          markerId: const MarkerId('marker_id'),
          position: const LatLng(
            49.84963739818297,
            24.026194826314512,
          ),
          onTap: () {
            _customInfoWindowController.addInfoWindow!(
              Column(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      width: double.infinity,
                      height: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.account_circle,
                              color: Colors.white,
                              size: 30,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              'I am here',
                              style: context.textTheme.titleLarge!.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Triangle.isosceles(
                    edge: Edge.BOTTOM,
                    child: Container(
                      color: Colors.blue,
                      width: 20,
                      height: 10,
                    ),
                  ),
                ],
              ),
              const LatLng(
                49.84963739818297,
                24.026194826314512,
              ),
            );
          },
        ),
      )
      ..add(
        Marker(
          markerId: const MarkerId('marker_id1'),
          position: const LatLng(
            49.848970245671566,
            24.03759697474103,
          ),
          onTap: () {
            _customInfoWindowController.addInfoWindow!(
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(AppLayouts.defaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: ImagePlaceHolder(),
                      ),
                      const SizedBox(
                        height: AppLayouts.defaultPadding,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'locationName',
                            style: context.textTheme.titleMedium,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: AppColors.starIconColor,
                              ),
                              Text(
                                '(5)',
                                style: context.textTheme.titleLarge,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Divider(),
                      Text(
                        'locationDescription',
                        style: context.textTheme.bodyLarge,
                      ),
                      const SizedBox(
                        height: AppLayouts.defaultPadding,
                      ),
                      const Row(
                        children: [
                          Icon(Icons.schedule),
                          SizedBox(
                            width: AppLayouts.defaultPadding / 2,
                          ),
                          Expanded(
                            child: Text(
                              'WorkingSchedule',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: AppLayouts.defaultPadding / 2,
                      ),
                      const Row(
                        children: [
                          Icon(Icons.location_on_outlined),
                          SizedBox(
                            width: AppLayouts.defaultPadding / 2,
                          ),
                          Expanded(
                            child: Text(
                              'locationAdress',
                            ),
                          ),
                        ],
                      ),
                      const Divider(),
                      Row(
                        children: [
                          TextButton.icon(
                            onPressed: () {
                              context.go(HomeScreen.route);
                            },
                            icon: const Icon(Icons.drive_eta),
                            label: const Text("Let's go"),
                          ),
                          TextButton.icon(
                            onPressed: () {
                              context.go(SettingsScreen.route);
                            },
                            icon: const Icon(Icons.info_outline),
                            label: const Text('View info'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const LatLng(
                49.848970245671566,
                24.03759697474103,
              ),
            );
          },
        ),
      );

    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr.navigationBarLabel1),
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            onTap: (position) {
              _customInfoWindowController.hideInfoWindow!();
            },
            onCameraMove: (position) {
              _customInfoWindowController.onCameraMove!();
            },
            onMapCreated: (GoogleMapController controller) async {
              _customInfoWindowController.googleMapController = controller;
            },
            markers: _markers,
            initialCameraPosition: CameraPosition(
              target: currentPosition,
              zoom: _zoom,
            ),
          ),
          CustomInfoWindow(
            controller: _customInfoWindowController,
            height: 360,
            width: 278,
          ),
        ],
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

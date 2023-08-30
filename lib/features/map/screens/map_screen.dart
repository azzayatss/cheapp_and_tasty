//TODO azzayats: 1 - implement access to device geoposition + currentLocation controller
//TODO azzayats: 2 - display the user's location when the map screen is open
//TODO azzayats: 3 - show map markers from db locations list
//TODO azzayats: 4 - implement custom info widget with view details and go to location button
//https://pub.dev/packages/custom_info_window/example
//TODO azzayats: 5 -  add geoposition to locationEntity -> google maps adress picker + adress to LatLng converter

import 'dart:async';
import 'dart:developer' as dev;

import 'package:cheapp_and_tasty/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  static const route = '/map';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.tr.navigationBarLabel1),
        ),
        body:
            // const Center(
            //   child: Text('sads'),
            // ),

            GoogleMap(
          initialCameraPosition: const CameraPosition(
            target: LatLng(
              49.842957,
              24.031111,
            ),
            zoom: 13.5,
          ),
          onMapCreated: (GoogleMapController controller) {
            Completer<GoogleMapController>().complete(controller);
          },
          markers: {
            Marker(
              onTap: () => dev.log('tapped'),
              markerId: const MarkerId('asdasdasdaqweqwe123123qweqwe412'),
              position: const LatLng(
                49.84890577036393,
                24.030671653555967,
              ),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueViolet,
              ),
              // infoWindow: InfoWindow(
              //   title: 'Test pin',
              //   snippet: 'below title text',
              //   onTap: () => context.go(HomeScreen.route),
              // ),
            ),
          },
        ),
      ),
    );
  }
}

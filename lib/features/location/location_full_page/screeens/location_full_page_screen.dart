import 'package:cheapp_and_tasty/config/app_layouts.dart';
import 'package:cheapp_and_tasty/features/location/location_full_page/widgets/about_location_widget.dart';
import 'package:cheapp_and_tasty/features/location/location_full_page/widgets/location_images.dart';
import 'package:cheapp_and_tasty/features/location/location_full_page/widgets/location_menu_images.dart';
import 'package:cheapp_and_tasty/features/location/locations_listing/controllers/location_list_controller.dart';
import 'package:cheapp_and_tasty/features/map/controllers/current_location_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class LocationFullScreen extends StatelessWidget {
  const LocationFullScreen({required this.id, super.key});
  final String id;
  static const route = 'location-full-page/:locationId';
  static const routeName = 'locationfullpage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: Consumer(
        builder: (context, ref, _) {
          final currentPosition = ref.watch(currentLocationControllerProvider);
          final list = ref.watch(locationListControllerProvider);
          return list.when(
            data: (data) {
              final location =
                  data.firstWhere((element) => element.locationId == id);
              return FloatingActionButton(
                onPressed: () {
                  final url = Uri.tryParse(
                    'https://www.google.com/maps/dir/?api=1&origin=${currentPosition.latitude}%2C${currentPosition.longitude}&destination=${location.locationLatitude}%2C${location.locationLongitude}',
                  );
                  if (url == null) {
                    return;
                  }
                  launchUrl(
                    url,
                    mode: LaunchMode.externalApplication,
                  );
                },
                child: const Icon(Icons.drive_eta),
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppLayouts.defaultPadding),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AboutLocationWidget(id: id),
              const SizedBox(
                height: AppLayouts.defaultPadding,
              ),
              LocationMenuImages(
                id: id,
              ),
              const SizedBox(
                height: AppLayouts.defaultPadding,
              ),
              LocationImages(
                id: id,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

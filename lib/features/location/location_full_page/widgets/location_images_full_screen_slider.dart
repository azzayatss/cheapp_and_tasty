import 'package:carousel_slider/carousel_slider.dart';
import 'package:cheapp_and_tasty/features/location/controllers/global_location_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LocationImagesFullScreenSlider extends ConsumerWidget {
  const LocationImagesFullScreenSlider({
    required this.id,
    super.key,
  });
  static const route = 'location-images-full-screen-slider/:idImages';
  static const routeName = 'locationImagesFullScreenSlider';
  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final location = ref
        .watch(globalLocationsListControllerProvider)
        .firstWhere((element) => element.locationId == id);

    return Scaffold(
      appBar: AppBar(),
      body: Builder(
        builder: (context) {
          final height = MediaQuery.of(context).size.height;
          return CarouselSlider(
            options: CarouselOptions(
              height: height,
              viewportFraction: 1,
            ),
            items: location.locationImages
                .map(
                  (item) => Center(
                    child: Image.network(
                      item,
                      fit: BoxFit.fitWidth,
                      height: height,
                    ),
                  ),
                )
                .toList(),
          );
        },
      ),
    );
  }
}

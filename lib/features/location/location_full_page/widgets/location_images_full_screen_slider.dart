import 'package:carousel_slider/carousel_slider.dart';
import 'package:cheapp_and_tasty/features/location/locations_listing/controllers/location_list_controller.dart';
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
  //todo azzayatss: after clicking on any item in small images carousel big image slider always
  //todo opens from 0 index -> which image was clicked this image should be opened in full size
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.watch(locationListControllerProvider);

    return list.when(
      data: (data) {
        final location = data.firstWhere((element) => element.locationId == id);
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

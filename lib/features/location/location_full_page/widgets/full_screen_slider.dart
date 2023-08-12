import 'package:carousel_slider/carousel_slider.dart';
import 'package:cheapp_and_tasty/features/location/controllers/global_location_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FullScreenSlider extends ConsumerWidget {
  const FullScreenSlider({
    super.key,
    this.id,
    this.isMenuSection,
  });
  static const route = 'full-screen-slider';
  static const routeName = 'fullscreenslider';
  final String? id;
  final String? isMenuSection;

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
            items: isMenuSection == null
                ? location.locationImages
                    .map(
                      (item) => Center(
                        child: Image.network(
                          item,
                          fit: BoxFit.cover,
                          height: height,
                        ),
                      ),
                    )
                    .toList()
                : location.locationMenuImages
                    .map(
                      (item) => Center(
                        child: Image.network(
                          item,
                          fit: BoxFit.cover,
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

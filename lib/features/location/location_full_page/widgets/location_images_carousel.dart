import 'package:cheapp_and_tasty/config/app_layouts.dart';
import 'package:cheapp_and_tasty/features/location/location_full_page/widgets/location_menu_full_screen_slider.dart';
import 'package:cheapp_and_tasty/features/location/locations_listing/controllers/location_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LocationImagesSmallSlider extends ConsumerWidget {
  const LocationImagesSmallSlider({
    required this.id,
    super.key,
  });
  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.watch(locationListControllerProvider);

    return list.when(
      data: (data) {
        final location = data.firstWhere((element) => element.locationId == id);

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: location.locationImages.map((e) {
              return Padding(
                padding: const EdgeInsets.all(
                  AppLayouts.defaultPadding / 3,
                ),
                child: GestureDetector(
                  onTap: () {
                    context.goNamed(
                      LocationMenuFullScreenSlider.routeName,
                      pathParameters: {
                        'locationId': id,
                        'id': id,
                      },
                    );
                  },
                  child: Image.network(
                    e,
                    fit: BoxFit.fitWidth,
                    width: 150,
                    height: 150,
                  ),
                ),
              );
            }).toList(),
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

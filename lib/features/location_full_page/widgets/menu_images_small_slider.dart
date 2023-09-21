import 'package:cheapp_and_tasty/config/app_layouts.dart';
import 'package:cheapp_and_tasty/features/location_full_page/widgets/image_place_holder.dart';
import 'package:cheapp_and_tasty/features/location_full_page/widgets/location_menu_full_screen_slider.dart';
import 'package:cheapp_and_tasty/features/locations_listing/controllers/location_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MenuImagesSmallSlider extends ConsumerWidget {
  const MenuImagesSmallSlider({
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

        if (location.locationMenuImages.isEmpty) {
          return const ImagePlaceHolder();
        } else {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: location.locationMenuImages.map((e) {
                return Padding(
                  padding: const EdgeInsets.all(
                    AppLayouts.defaultPadding / 3,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      context.goNamed(
                        LocationMenuFullScreenSlider.routeName,
                        queryParameters: {
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
        }
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

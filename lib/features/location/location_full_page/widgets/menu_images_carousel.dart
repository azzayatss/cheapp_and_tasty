import 'package:carousel_slider/carousel_slider.dart';
import 'package:cheapp_and_tasty/extensions/build_context_extension.dart';
import 'package:cheapp_and_tasty/features/location/controllers/global_location_list_controller.dart';
import 'package:cheapp_and_tasty/features/location/location_full_page/widgets/location_menu_full_screen_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MenuImageCarousel extends ConsumerWidget {
  const MenuImageCarousel({
    required this.id,
    super.key,
  });
  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final location = ref
        .watch(globalLocationsListControllerProvider)
        .firstWhere((element) => element.locationId == id);

    return CarouselSlider.builder(
      options: CarouselOptions(
        height: 150,
        aspectRatio: 2,
        viewportFraction: 1,
      ),
      itemCount: 2,
      itemBuilder: (context, index, realIdx) {
        final first = index * 2;
        final second = first + 1;
        return location.locationMenuImages.isEmpty
            ? Center(
                child: Text(
                  context.tr.thereAreNoPhotosYet,
                  style: context.textTheme.labelMedium,
                ),
              )
            : Row(
                children: [first, second].map((idx) {
                  return Expanded(
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
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: Image.network(
                          location.locationMenuImages[idx],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              );
      },
    );
  }
}

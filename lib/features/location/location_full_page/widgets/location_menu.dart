import 'package:cheapp_and_tasty/config/app_layouts.dart';
import 'package:cheapp_and_tasty/extensions/build_context_extension.dart';
import 'package:cheapp_and_tasty/features/location/controllers/global_location_list_controller.dart';
import 'package:cheapp_and_tasty/features/location/location_full_page/widgets/menu_images_carousel.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LocationMenu extends ConsumerWidget {
  const LocationMenu({
    required this.id,
    super.key,
  });

  final String? id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final location = ref
        .watch(globalLocationsListControllerProvider)
        .firstWhere((element) => element.locationId == id);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppLayouts.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${location.locationId}  ${context.tr.menuLabel}',
              style: context.textTheme.headlineLarge,
            ),
            const Divider(),
            // Text(location.locationId)
            const MenuImageCarousel(),
          ],
        ),
      ),
    );
  }
}

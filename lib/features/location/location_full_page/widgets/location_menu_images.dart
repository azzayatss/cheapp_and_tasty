import 'package:cheapp_and_tasty/config/app_layouts.dart';
import 'package:cheapp_and_tasty/extensions/build_context_extension.dart';
import 'package:cheapp_and_tasty/features/location/location_full_page/widgets/menu_images_carousel.dart';
import 'package:flutter/material.dart';

class LocationMenuImages extends StatelessWidget {
  const LocationMenuImages({
    required this.id,
    super.key,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppLayouts.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              context.tr.menuLabel,
              style: context.textTheme.headlineLarge,
            ),
            const Divider(),
            MenuImageCarousel(
              id: id,
            ),
          ],
        ),
      ),
    );
  }
}

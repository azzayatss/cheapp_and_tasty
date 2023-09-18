import 'package:cheapp_and_tasty/config/app_layouts.dart';
import 'package:cheapp_and_tasty/extensions/build_context_extension.dart';
import 'package:cheapp_and_tasty/features/location_full_page/widgets/location_images_small_slider.dart';
import 'package:flutter/material.dart';

class LocationImages extends StatelessWidget {
  const LocationImages({
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
              context.tr.locationPhoto,
              style: context.textTheme.headlineSmall,
            ),
            const Divider(),
            LocationImagesSmallSlider(
              id: id,
            ),
          ],
        ),
      ),
    );
  }
}

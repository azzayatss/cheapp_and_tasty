import 'package:cheapp_and_tasty/config/app_layouts.dart';
import 'package:cheapp_and_tasty/extensions/build_context_extension.dart';
import 'package:cheapp_and_tasty/features/location/location_full_page/widgets/menu_images_carousel.dart';
import 'package:flutter/material.dart';

class LocationImagesSection extends StatelessWidget {
  const LocationImagesSection({
    required this.id,
    required this.sectionTitle,
    required this.isMenuSection,
    super.key,
  });

  final String id;
  final String sectionTitle;
  final bool isMenuSection;

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
              sectionTitle,
              style: context.textTheme.headlineLarge,
            ),
            const Divider(),
            MenuImageCarousel(
              id: id,
              isMenuSection: isMenuSection,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:cheapp_and_tasty/config/app_layouts.dart';
import 'package:cheapp_and_tasty/extensions/build_context_extension.dart';
import 'package:cheapp_and_tasty/features/location/location_full_page/widgets/about_location_widget.dart';
import 'package:cheapp_and_tasty/features/location/location_full_page/widgets/location_images_section.dart';
import 'package:flutter/material.dart';

class LocationFullScreen extends StatelessWidget {
  const LocationFullScreen({required this.id, super.key});
  final String id;
  static const route = 'location-full-page/:id';
  static const routeName = 'locationfullpage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(AppLayouts.defaultPadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AboutLocationWidget(id: id),
              const SizedBox(
                height: AppLayouts.defaultPadding,
              ),
              LocationImagesSection(
                sectionTitle: context.tr.menuLabel,
                id: id,
                isMenuSection: true,
              ),
              const SizedBox(
                height: AppLayouts.defaultPadding,
              ),
              LocationImagesSection(
                sectionTitle: 'Фото локації:',
                id: id,
                isMenuSection: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

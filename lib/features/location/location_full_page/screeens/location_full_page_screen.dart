import 'package:cheapp_and_tasty/config/app_layouts.dart';
import 'package:cheapp_and_tasty/features/location/location_full_page/widgets/about_location_widget.dart';
import 'package:cheapp_and_tasty/features/location/location_full_page/widgets/back_hint.dart';
import 'package:cheapp_and_tasty/features/location/location_full_page/widgets/location_menu.dart';
import 'package:flutter/material.dart';

class LocationFullScreen extends StatelessWidget {
  const LocationFullScreen({required this.id, super.key});
  final String id;
  static const route = 'location-full-page/:id';
  static const routeName = 'locationfullpage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(AppLayouts.defaultPadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const BackHint(),
              AboutLocationWidget(id: id),
              const SizedBox(
                height: AppLayouts.defaultPadding,
              ),
              LocationMenu(
                id: id,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

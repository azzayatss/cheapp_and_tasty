import 'package:cheapp_and_tasty/config/app_layouts.dart';
import 'package:cheapp_and_tasty/features/location/entities/location_entity.dart';
import 'package:flutter/material.dart';

class LocationAdressWithIconRow extends StatelessWidget {
  const LocationAdressWithIconRow({
    required this.location,
    super.key,
  });

  final LocationEntity location;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.location_on_outlined),
        const SizedBox(
          width: AppLayouts.defaultPadding / 2,
        ),
        Text(
          location.locationAdress,
        ),
      ],
    );
  }
}

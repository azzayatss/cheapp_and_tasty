import 'package:cheapp_and_tasty/config/app_layouts.dart';
import 'package:cheapp_and_tasty/config/constants/app_constants.dart';
import 'package:cheapp_and_tasty/extensions/build_context_extension.dart';
import 'package:cheapp_and_tasty/features/location/entities/location_entity.dart';
import 'package:cheapp_and_tasty/features/location/locations_listing/controllers/distance_to_location_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HowFarLocationWithIconRow extends HookConsumerWidget {
  const HowFarLocationWithIconRow({
    required this.location,
    this.currentPosition,
    super.key,
  });

  final LocationEntity location;
  final LatLng? currentPosition;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final distanceAndDuration = ref
        .watch(
          distanceToLocationProvider(
            currentPositionLatitude:
                currentPosition?.latitude ?? AppConstants.lvivLatitude,
            currentPositionLongitude:
                currentPosition?.longitude ?? AppConstants.lvivLongitude,
            locationLatitude: location.locationLatitude,
            locationLongitude: location.locationLongitude,
          ),
        )
        .valueOrNull;

    return Row(
      children: [
        Icon(
          Icons.directions_outlined,
          color: context.colorScheme.primary,
        ),
        const SizedBox(
          width: AppLayouts.defaultPadding / 2,
        ),
        Expanded(
          child: Text(
            '${distanceAndDuration?[0] ?? '0 km'} до локації (${distanceAndDuration?[1] ?? '0 mins'})',
            style: TextStyle(color: context.colorScheme.primary),
          ),
        ),
      ],
    );
  }
}

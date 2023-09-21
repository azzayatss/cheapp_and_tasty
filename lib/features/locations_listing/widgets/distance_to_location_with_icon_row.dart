import 'package:cheapp_and_tasty/config/app_layouts.dart';
import 'package:cheapp_and_tasty/extensions/build_context_extension.dart';
import 'package:cheapp_and_tasty/features/locations_listing/controllers/distances_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DistanceToLocationWidget extends HookConsumerWidget {
  const DistanceToLocationWidget({
    required this.locationId,
    super.key,
  });

  final String locationId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locationsWithDistnacesList =
        ref.watch(distancesListControllerProvider);

    if (locationsWithDistnacesList.isEmpty) {
      return const CircularProgressIndicator.adaptive();
    }

    final location = locationsWithDistnacesList
        .firstWhere((element) => element.location.locationId == locationId);
    final distanceToLocation = location.distanceToLocation.toString();

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
            '$distanceToLocation км до локації',
            style: TextStyle(color: context.colorScheme.primary),
          ),
        ),
      ],
    );
  }
}

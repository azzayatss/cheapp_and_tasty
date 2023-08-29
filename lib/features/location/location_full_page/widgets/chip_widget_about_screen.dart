import 'package:cheapp_and_tasty/config/app_layouts.dart';
import 'package:cheapp_and_tasty/extensions/build_context_extension.dart';
import 'package:cheapp_and_tasty/features/location/entities/location_entity.dart';
import 'package:cheapp_and_tasty/features/location/enums/additional_services_chips.dart';
import 'package:flutter/material.dart';

class ChipWidgetAboutScreen extends StatelessWidget {
  const ChipWidgetAboutScreen({
    required this.locationEntity,
    required this.index,
    super.key,
  });

  final LocationEntity locationEntity;
  final int index;

  @override
  Widget build(BuildContext context) {
    final value = AdditionalServicesChips.values[index];
    final location = locationEntity.additionalServicesChips;
    return Chip(
      backgroundColor: location.contains(
        value.name,
      )
          ? context.colorScheme.primary
          : null,
      labelStyle: location.contains(
        value.name,
      )
          ? TextStyle(
              color: context.colorScheme.onPrimary,
            )
          : null,
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            value.icon,
            color: location.contains(
              value.name,
            )
                ? context.colorScheme.onPrimary
                : null,
            size: 16,
          ),
          const SizedBox(
            width: AppLayouts.defaultPadding / 2,
          ),
          Text(
            value.chipLabel(context.tr),
          ),
        ],
      ),
    );
  }
}

import 'package:cheapp_and_tasty/config/theme/app_colors.dart';
import 'package:cheapp_and_tasty/extensions/build_context_extension.dart';
import 'package:cheapp_and_tasty/features/location/entities/location_entity.dart';
import 'package:flutter/material.dart';

class LocationNameAndRatingRow extends StatelessWidget {
  const LocationNameAndRatingRow({
    required this.location,
    super.key,
  });

  final LocationEntity location;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          location.locationName,
          style: context.textTheme.titleLarge,
        ),
        Row(
          children: [
            const Icon(
              Icons.star,
              color: AppColors.starIconColor,
            ),
            Text(
              '(${location.locationRate})',
              style: context.textTheme.titleLarge,
            ),
          ],
        ),
      ],
    );
  }
}

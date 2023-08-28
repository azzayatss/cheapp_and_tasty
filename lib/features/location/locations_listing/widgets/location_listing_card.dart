import 'package:cheapp_and_tasty/config/app_layouts.dart';
import 'package:cheapp_and_tasty/extensions/build_context_extension.dart';
import 'package:cheapp_and_tasty/features/location/entities/location_entity.dart';
import 'package:cheapp_and_tasty/features/location/location_full_page/widgets/location_adress_with_icon_row.dart';
import 'package:cheapp_and_tasty/features/location/location_full_page/widgets/location_name_and_rating_row.dart';
import 'package:cheapp_and_tasty/features/location/location_full_page/widgets/location_schedule_with_icon_row.dart';
import 'package:flutter/material.dart';

class LocationListingCard extends StatelessWidget {
  const LocationListingCard({
    required this.item,
    super.key,
  });

  final LocationEntity item;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppLayouts.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (item.locationCoverPhoto != '')
              Image.network(
                item.locationCoverPhoto,
                height: 300,
                width: 400,
                fit: BoxFit.fitWidth,
              )
            else
              const Center(
                child: Icon(
                  Icons.image_not_supported_outlined,
                  size: 200,
                ),
              ),
            const SizedBox(
              height: AppLayouts.defaultPadding,
            ),
            LocationNameAndRatingRow(location: item),
            const Divider(),
            Text(
              item.locationDescription,
              style: context.textTheme.bodyLarge,
            ),
            const SizedBox(
              height: AppLayouts.defaultPadding,
            ),
            LocationScheduleWithIconRow(location: item),
            const SizedBox(
              height: AppLayouts.defaultPadding / 2,
            ),
            LocationAdressWithIconRow(location: item),
          ],
        ),
      ),
    );
  }
}

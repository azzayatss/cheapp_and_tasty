import 'package:cheapp_and_tasty/config/app_layouts.dart';
import 'package:cheapp_and_tasty/extensions/build_context_extension.dart';
import 'package:cheapp_and_tasty/features/location/entities/location_entity.dart';
import 'package:cheapp_and_tasty/features/location_full_page/widgets/image_place_holder.dart';
import 'package:cheapp_and_tasty/features/location_full_page/widgets/location_adress_with_icon_row.dart';
import 'package:cheapp_and_tasty/features/location_full_page/widgets/location_schedule_with_icon_row.dart';
import 'package:cheapp_and_tasty/features/locations_listing/widgets/distance_to_location_with_icon_row.dart';
import 'package:cheapp_and_tasty/features/map/widgets/rate_bar_displayment_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationListingCard extends StatelessWidget {
  const LocationListingCard({
    required this.item,
    this.currentPosition,
    super.key,
  });

  final LocationEntity item;
  final LatLng? currentPosition;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppLayouts.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (item.locationCoverPhoto.isNotEmpty)
              Image.network(
                item.locationCoverPhoto,
                height: 300,
                width: 400,
                fit: BoxFit.fitWidth,
              )
            else
              const Center(
                child: ImagePlaceHolder(),
              ),
            const SizedBox(
              height: AppLayouts.defaultPadding,
            ),
            Text(
              item.locationName.toUpperCase(),
              style: context.textTheme.titleLarge,
            ),
            RateBarWidget(
              location: item,
              textStyle: context.textTheme.labelLarge,
              starSize: 20,
            ),
            // LocationNameAndRatingRow(location: item),
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
            const SizedBox(
              height: AppLayouts.defaultPadding / 2,
            ),
            DistanceToLocationWidget(
              location: item,
              currentPosition: currentPosition,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:cheapp_and_tasty/config/app_layouts.dart';
import 'package:cheapp_and_tasty/config/theme/app_colors.dart';
import 'package:cheapp_and_tasty/extensions/build_context_extension.dart';
import 'package:cheapp_and_tasty/features/location/entities/location_entity.dart';
import 'package:cheapp_and_tasty/features/location/location_full_page/screeens/location_full_page_screen.dart';
import 'package:cheapp_and_tasty/features/location/location_full_page/widgets/image_place_holder.dart';
import 'package:cheapp_and_tasty/features/map/controllers/current_location_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class MapMarkerInfoWindowCard extends ConsumerWidget {
  const MapMarkerInfoWindowCard({
    required this.location,
    super.key,
  });

  final LocationEntity location;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPosition = ref.watch(currentLocationControllerProvider);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppLayouts.defaultPadding),
        child: Row(
          children: [
            if (location.locationCoverPhoto.isNotEmpty)
              Image.network(
                location.locationCoverPhoto,
                height: 100,
                width: 100,
                fit: BoxFit.fitWidth,
              )
            else
              const Center(
                child: ImagePlaceHolder(),
              ),
            const VerticalDivider(),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    location.locationName.toUpperCase(),
                    style: context.textTheme.labelMedium,
                  ),
                  Row(
                    children: [
                      Text(
                        '${location.locationRate}',
                        style: context.textTheme.labelMedium,
                      ),
                      const SizedBox(
                        width: AppLayouts.defaultPadding / 4,
                      ),
                      RatingBarIndicator(
                        itemSize: 12,
                        rating: location.locationRate,
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: AppColors.starIconColor,
                        ),
                      ),
                      const SizedBox(
                        width: AppLayouts.defaultPadding / 4,
                      ),
                      Text(
                        //TODO azzayats feature: replace harcoded data with real rates quantity
                        '(234)',
                        style: context.textTheme.labelMedium,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: AppLayouts.defaultPadding / 2,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        size: 15,
                      ),
                      const SizedBox(
                        width: AppLayouts.defaultPadding / 4,
                      ),
                      Expanded(
                        child: Text(
                          location.locationAdress,
                          style: context.textTheme.labelSmall,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: AppLayouts.defaultPadding / 3,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.schedule_outlined,
                        size: 15,
                      ),
                      const SizedBox(
                        width: AppLayouts.defaultPadding / 3,
                      ),
                      Expanded(
                        child: Text(
                          location.locationWorkingSchedule,
                          style: context.textTheme.labelSmall,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton.icon(
                        onPressed: () {
                          final url = Uri.tryParse(
                            'https://www.google.com/maps/dir/?api=1&origin=${currentPosition.latitude}%2C${currentPosition.longitude}&destination=${location.locationLatitude}%2C${location.locationLongitude}',
                          );
                          if (url == null) {
                            return;
                          }
                          launchUrl(
                            url,
                            mode: LaunchMode.externalApplication,
                          );
                        },
                        icon: const Icon(
                          Icons.drive_eta,
                          size: 17,
                        ),
                        label: Text(
                          context.tr.goNow,
                        ),
                      ),
                      TextButton.icon(
                        onPressed: () {
                          context.pushNamed(
                            LocationFullScreen.routeName,
                            pathParameters: {'locationId': location.locationId},
                          );
                        },
                        icon: const Icon(
                          Icons.info,
                          size: 17,
                        ),
                        label: Text(
                          context.tr.viewInfo,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

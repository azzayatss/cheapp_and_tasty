import 'package:cheapp_and_tasty/config/app_layouts.dart';
import 'package:cheapp_and_tasty/extensions/build_context_extension.dart';
import 'package:cheapp_and_tasty/features/location/controllers/global_location_list_controller.dart';
import 'package:cheapp_and_tasty/features/location/location_full_page/widgets/location_adress_with_icon_row.dart';
import 'package:cheapp_and_tasty/features/location/location_full_page/widgets/location_name_and_rating_row.dart';
import 'package:cheapp_and_tasty/features/location/location_full_page/widgets/location_schedule_with_icon_row.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AboutLocationWidget extends ConsumerWidget {
  const AboutLocationWidget({required this.id, super.key});

  final String? id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final location = ref
        .watch(globalLocationsListControllerProvider)
        .firstWhere((element) => element.locationId == id);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppLayouts.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(
              location.locationCoverPhoto,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: AppLayouts.defaultPadding,
            ),
            Text(
              context.tr.aboutLocation,
              style: context.textTheme.headlineLarge,
            ),
            const Divider(),
            const SizedBox(
              height: AppLayouts.defaultPadding,
            ),
            LocationNameAndRatingRow(location: location),
            const SizedBox(
              height: AppLayouts.defaultPadding,
            ),
            Text(
              location.locationDescription,
              style: context.textTheme.bodyLarge,
            ),
            const SizedBox(
              height: AppLayouts.defaultPadding,
            ),
            LocationAdressWithIconRow(location: location),
            const SizedBox(
              height: AppLayouts.defaultPadding,
            ),
            LocationScheduleWithIconRow(location: location),
            const SizedBox(
              height: AppLayouts.defaultPadding,
            ),
            Row(
              children: [
                const Icon(Icons.reviews_outlined),
                const SizedBox(
                  width: AppLayouts.defaultPadding / 2,
                ),
                Text(
                  location.locationReviews,
                ),
              ],
            ),
            const SizedBox(
              height: AppLayouts.defaultPadding,
            ),
            Row(
              children: [
                const Icon(Icons.person_2_outlined),
                const SizedBox(
                  width: AppLayouts.defaultPadding / 2,
                ),
                Text(
                  location.personWhoAddedLocation,
                ),
              ],
            ),
            const Divider(),
            const SizedBox(
              height: AppLayouts.defaultPadding,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(context.tr.deliveryLabel),
                    const SizedBox(
                      height: AppLayouts.defaultPadding / 2,
                    ),
                    getIcon(location.doesLocationHaveDelivery),
                  ],
                ),
                Column(
                  children: [
                    Text(context.tr.takeAwayLabel),
                    const SizedBox(
                      height: AppLayouts.defaultPadding / 2,
                    ),
                    getIcon(location.doesLocationHaveTakeAway),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: AppLayouts.defaultPadding,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(context.tr.parkingLabel),
                    const SizedBox(
                      height: AppLayouts.defaultPadding / 2,
                    ),
                    getIcon(location.doesLocationHaveOwnParking),
                  ],
                ),
                Column(
                  children: [
                    Text(context.tr.cardPaymentsLabel),
                    const SizedBox(
                      height: AppLayouts.defaultPadding / 2,
                    ),
                    getIcon(location.doesLocationHaveCardPayments),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: AppLayouts.defaultPadding,
            ),
          ],
        ),
      ),
    );
  }

  Icon getIcon(bool iconValue) {
    return iconValue ? const Icon(Icons.check) : const Icon(Icons.block);
  }
}

//TODO feature: "suggest edits"

import 'package:cheapp_and_tasty/config/app_layouts.dart';
import 'package:cheapp_and_tasty/extensions/build_context_extension.dart';
import 'package:cheapp_and_tasty/features/location/enums/additional_services_chips.dart';
import 'package:cheapp_and_tasty/features/location/location_full_page/widgets/chip_widget_about_screen.dart';
import 'package:cheapp_and_tasty/features/location/location_full_page/widgets/image_place_holder.dart';
import 'package:cheapp_and_tasty/features/location/location_full_page/widgets/location_adress_with_icon_row.dart';
import 'package:cheapp_and_tasty/features/location/location_full_page/widgets/location_name_and_rating_row.dart';
import 'package:cheapp_and_tasty/features/location/location_full_page/widgets/location_schedule_with_icon_row.dart';
import 'package:cheapp_and_tasty/features/location/locations_listing/controllers/location_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AboutLocationWidget extends ConsumerWidget {
  const AboutLocationWidget({required this.id, super.key});

  final String? id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.watch(locationListControllerProvider);

    return list.when(
      data: (data) {
        final location = data.firstWhere((element) => element.locationId == id);
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(AppLayouts.defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (location.locationCoverPhoto.isNotEmpty)
                  Image.network(
                    location.locationCoverPhoto,
                    fit: BoxFit.cover,
                  )
                else
                  const ImagePlaceHolder(),
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
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.reviews_outlined),
                    const SizedBox(
                      width: AppLayouts.defaultPadding / 2,
                    ),
                    Expanded(
                      child: Text(
                        location.locationReviews,
                      ),
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
                if (location.additionalServicesChips.isEmpty)
                  Text(
                    context.tr.emptyAdditionalServicesWarning,
                  )
                else
                  Wrap(
                    spacing: AppLayouts.defaultPadding / 3,
                    children: [
                      for (var index = 0;
                          index < AdditionalServicesChips.values.length;
                          index++)
                        ChipWidgetAboutScreen(
                          locationEntity: location,
                          index: index,
                        ),
                    ],
                  ),
              ],
            ),
          ),
        );
      },
      error: (error, _) => Center(
        child: Text(error.toString()),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }
}

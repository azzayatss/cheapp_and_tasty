import 'package:cheapp_and_tasty/config/app_layouts.dart';
import 'package:cheapp_and_tasty/features/location/controllers/global_location_list_controller.dart';
import 'package:cheapp_and_tasty/features/location/locations_listing/screens/locations_listing_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LocationFullScreen extends ConsumerWidget {
  const LocationFullScreen({super.key, this.id});
  final String? id;
  static const route = '/location-full-page/:id';
  static const routeName = 'locationfullpage';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final location = ref
        .watch(globalLocationsListControllerProvider)
        .firstWhere((element) => element.locationId == id);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.go(LocationListScreen.route);
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppLayouts.defaultPadding),
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                location.locationName,
              ),
              Text(
                location.locationId,
              ),
              Text(
                location.locationDescription,
              ),
              Text(
                location.locationLatitude.toString(),
              ),
              Text(
                location.locationLongitude.toString(),
              ),
              Text(
                location.locationWorkingSchedule,
              ),
              Text(
                location.locationReviews,
              ),
              Text(
                location.locationRate.toString(),
              ),
              Text(
                location.personWhoAddedLocation,
              ),
              Text(
                location.dateTimeWhenLocationAdded.toString(),
              ),
              Text(
                location.doesLocationHaveDelivery.toString(),
              ),
              Text(
                location.doesLocationHaveTakeAway.toString(),
              ),
              Text(
                location.doesLocationHaveOwnParking.toString(),
              ),
              Text(
                location.doesLocationHaveCardPayments.toString(),
              ),
            ],
          ),
        ),
      ),

      // Center(
      //   child: Text('location full page + $id'),
      // ),
    );
  }
}

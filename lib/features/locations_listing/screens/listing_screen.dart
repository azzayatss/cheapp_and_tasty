import 'package:cheapp_and_tasty/features/locations_listing/widgets/location_listing_screen.dart';
import 'package:cheapp_and_tasty/features/map/controllers/current_location_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ListingScreen extends ConsumerWidget {
  const ListingScreen({super.key});

  static const route = '/list';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loadMap = ref.watch(loadMapRefProvider);
    return loadMap.when(
      data: (data) => const LocationsListingScreen(),
      error: (error, _) => Center(
        child: Text(error.toString()),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }
}

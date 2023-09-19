import 'package:cheapp_and_tasty/extensions/build_context_extension.dart';
import 'package:cheapp_and_tasty/features/add_location/screens/add_new_location_screen.dart';
import 'package:cheapp_and_tasty/features/locations_listing/widgets/listing_body.dart';
import 'package:cheapp_and_tasty/features/locations_listing/widgets/listing_header.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LocationsListingScreen extends StatelessWidget {
  const LocationsListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.tr.navigationBarLabel2),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            context.goNamed(AddNewLocationScreen.routeName);
          },
        ),
        body: const Column(
          children: [
            ListingHeader(),
            ListingBody(),
          ],
        ),
      ),
    );
  }
}

import 'package:cheapp_and_tasty/config/app_layouts.dart';
import 'package:cheapp_and_tasty/features/locations_listing/widgets/additional_services_filter_bar.dart';
import 'package:cheapp_and_tasty/features/locations_listing/widgets/search_bar_with_sort_icon.dart';
import 'package:flutter/material.dart';

class ListingHeader extends StatelessWidget {
  const ListingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(AppLayouts.defaultPadding),
      child: Column(
        children: [
          SearchBarWithSortIcon(),
          SizedBox(
            height: AppLayouts.defaultPadding,
          ),
          AdditionalServicesFilterBar(),
        ],
      ),
    );
  }
}

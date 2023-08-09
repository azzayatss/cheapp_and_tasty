import 'package:cheapp_and_tasty/features/add_new_location/widgets/add_new_location_button.dart';
import 'package:flutter/material.dart';

class LocationListScreen extends StatelessWidget {
  const LocationListScreen({super.key});

  static const route = '/list';

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Spacer(),
        Text('List Screen'),
        Spacer(),
        Align(
          alignment: Alignment.centerRight,
          child: AddNewLocationButton(),
        ),
      ],
    );
  }
}

import 'package:cheapp_and_tasty/features/add_new_location/widgets/add_new_location_button.dart';
import 'package:flutter/material.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  static const route = '/map';

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Spacer(),
        Text('Map Screen'),
        Spacer(),
        Align(
          alignment: Alignment.centerRight,
          child: AddNewLocationButton(),
        ),
      ],
    );
  }
}

import 'package:cheapp_and_tasty/config/app_layouts.dart';
import 'package:flutter/material.dart';

class AddNewLocationButton extends StatelessWidget {
  const AddNewLocationButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        AppLayouts.defaultPadding,
      ),
      child: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add_location_alt_outlined),
      ),
    );
  }
}

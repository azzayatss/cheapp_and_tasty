import 'dart:io';

import 'package:cheapp_and_tasty/config/app_layouts.dart';
import 'package:flutter/material.dart';

class PickedImagesSlider extends StatelessWidget {
  const PickedImagesSlider({
    required this.images,
    super.key,
  });

  final ValueNotifier<List<File?>> images;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: images.value.map((e) {
          return Padding(
            padding: const EdgeInsets.all(
              AppLayouts.defaultPadding / 3,
            ),
            child: Image.file(
              e!,
              width: 150,
              height: 150,
            ),
          );
        }).toList(),
      ),
    );
  }
}

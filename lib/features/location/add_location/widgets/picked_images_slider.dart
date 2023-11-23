import 'dart:io';

import 'package:cheapp_and_tasty/config/app_layouts.dart';
import 'package:cheapp_and_tasty/features/location/location_full_page/widgets/image_place_holder.dart';
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
        children: [
          for (var i = 0; i < images.value.length; i++)
            Padding(
              padding: const EdgeInsets.all(
                AppLayouts.defaultPadding / 3,
              ),
              child: images.value[i] != null
                  ? Image.file(
                      images.value[i]!,
                      width: 150,
                      height: 150,
                    )
                  : const ImagePlaceHolder(),
            ),
        ],
      ),
    );
  }
}

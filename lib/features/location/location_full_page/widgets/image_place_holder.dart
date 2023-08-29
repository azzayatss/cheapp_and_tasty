import 'package:flutter/material.dart';

class ImagePlaceHolder extends StatelessWidget {
  const ImagePlaceHolder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.image_not_supported_outlined,
      size: 100,
    );
  }
}

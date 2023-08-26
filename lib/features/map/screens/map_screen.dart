import 'dart:io';

import 'package:cheapp_and_tasty/extensions/build_context_extension.dart';
import 'package:cheapp_and_tasty/features/location/add_location/controllers/menu_images_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  static const route = '/map';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.tr.navigationBarLabel1),
        ),
        body:
            // Center(
            //   child: Text(context.tr.navigationBarLabel1),
            // ),
            Consumer(
          builder: (context, ref, child) {
            final menuImagesList = ref.watch(menuImagesControllerProvider);

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextButton(
                  onPressed: () {
                    print(menuImagesList.length);
                  },
                  child: const Text('print'),
                ),
                TextButton(
                  /// PICK AND SAVE 1 IMAGE
                  // onPressed: () async {
                  //   final picker = ImagePicker();
                  //   final xPhoto = await picker.pickImage(
                  //     source: ImageSource.gallery,
                  //     requestFullMetadata: false,
                  //   );
                  //   final photo = File(xPhoto!.path);
                  //   ref
                  //       .read(menuImagesControllerProvider.notifier)
                  //       .addItem(photo);
                  // },

                  ///PICK CONVERT AND SAVE MULTIPLE IMAGES
                  onPressed: () async {
                    final picker = ImagePicker();
                    final xPhotosList = await picker.pickMultiImage(
                      requestFullMetadata: false,
                    );
                    final photosList =
                        xPhotosList.map((e) => File(e.path)).toList();
                    ref
                        .read(menuImagesControllerProvider.notifier)
                        .addList(photosList);
                  },
                  child: const Text('pick'),
                ),
                TextButton(
                  onPressed: () {
                    ref
                        .read(menuImagesControllerProvider.notifier)
                        .addToStorage();
                  },
                  child: const Text('upload to storage'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

import 'dart:developer' as dev;
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'menu_images_controller.g.dart';

@riverpod
class MenuImagesController extends _$MenuImagesController {
  @override
  List<File?> build() {
    return [];
  }

  void addList(List<File?> photosList) {
    state = [...photosList];
  }

  List<File?> addItem(File? photo) {
    return [...state..add(photo)];
  }

  void clear() {
    state.clear();
  }

  Future<void> addToStorage() async {
    final storageRef = FirebaseStorage.instance.ref().child('images/');

    for (var i = 0; i < state.length; i++) {
      final ref = storageRef.child(const Uuid().v4());
      final file = state[i];
      dev.log(file.toString());
      try {
        final uploadTask = await ref.putFile(file!);
        final progress =
            100.0 * (uploadTask.bytesTransferred / uploadTask.totalBytes);
        dev.log(progress.toString());
      } on FirebaseException catch (e) {
        dev.log(e.message.toString());
      }
    }
  }

}

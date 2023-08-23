import 'dart:io';

import 'package:riverpod_annotation/riverpod_annotation.dart';

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
}

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chip_controller.g.dart';

@riverpod
class ChipController extends _$ChipController {
  @override
  List<String> build() {
    final list = <String>[];
    return list;
  }

  void addRemoveToList(String value) {
    if (state.contains(value)) {
      state.remove(value);
      state = [...state];
    } else {
      state = [...state, value];
    }
  }
}

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'switch_button_controller.g.dart';

@riverpod
class SwitchButtonController extends _$SwitchButtonController {
  @override
  bool build() {
    return state = true;
  }

  void changeValue(bool switchValue) {
    state = switchValue;
  }
}

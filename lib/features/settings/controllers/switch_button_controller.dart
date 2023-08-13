import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'switch_button_controller.g.dart';

@riverpod
class SwitchButtonController extends _$SwitchButtonController {
  bool value = true;
  @override
  bool build() {
    const value = true;
    return value;
  }

  void changeValue(bool switchValue) {
    state = switchValue;
  }
}

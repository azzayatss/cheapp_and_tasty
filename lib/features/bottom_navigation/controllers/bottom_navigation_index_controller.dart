import 'package:cheapp_and_tasty/features/bottom_navigation/enums/menu_items.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bottom_navigation_index_controller.g.dart';

@riverpod
class BottomNavigationIndexController
    extends _$BottomNavigationIndexController {
  @override
  MenuItems build() {
    return MenuItems.home;
  }

  MenuItems setIndex(MenuItems value) {
    return state = value;
  }
}

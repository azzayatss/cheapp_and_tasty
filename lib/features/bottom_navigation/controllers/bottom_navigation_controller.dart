import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bottom_navigation_controller.g.dart';

/// riverpod 1.0

// class BotoomNavigationController extends StateNotifier<int> {
//   BotoomNavigationController() : super(0);

//   void setIndex(int value) {
//     state = value;
//   }
// }

// final botoomNavigationControllerProvider =
//     StateNotifierProvider<BotoomNavigationController, int>(
//   (ref) => BotoomNavigationController(),
// );

//riverpod 2.0
@riverpod
class BottomNavBarController extends _$BottomNavBarController {
  @override
  int build() {
    return 0;
  }

  void setIndex(int value) {
    state = value;
  }
}

import 'package:hooks_riverpod/hooks_riverpod.dart';

class BotoomNavigationController extends StateNotifier<int> {
  BotoomNavigationController() : super(0);

  void setIndex(int value) {
    state = value;
  }
}

final botoomNavigationControllerProvider =
    StateNotifierProvider<BotoomNavigationController, int>(
  (ref) => BotoomNavigationController(),
);

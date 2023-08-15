import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'rating_controller.g.dart';

@riverpod
class RatingController extends _$RatingController {
  @override
  double build() {
    return 3;
  }

  void newRate({required double rating}) {
    state = rating;
  }
}

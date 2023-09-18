import 'package:cheapp_and_tasty/features/reviews/repositories/reviews_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'average_rate_controller.g.dart';

@riverpod
Future<List<double>> averageRateController(
  AverageRateControllerRef ref,
  String locationId,
) {
  return ref
      .watch(reviewsRepositoryProvider)
      .getAverageLocationRating(locationId: locationId);
}

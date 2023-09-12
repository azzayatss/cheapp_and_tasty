import 'package:cheapp_and_tasty/features/reviews/entities/review_entity.dart';
import 'package:cheapp_and_tasty/features/reviews/repositories/reviews_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'reviews_controller.g.dart';

@riverpod
Future<List<ReviewEntity>> reviewsListController(
  ReviewsListControllerRef ref,
  String locationId,
) {
  return ref
      .watch(reviewsRepositoryProvider)
      .getLocationReviews(locationId: locationId);
}

import 'package:cheapp_and_tasty/features/reviews/entities/review_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'reviews_repository.g.dart';

class ReviewsRepository {
  final database = FirebaseFirestore.instance;

  Future<DocumentReference<Map<String, dynamic>>> addInitialReview({
    required Map<String, dynamic> newReview,
    required String locationId,
  }) async {
    final querySnapshot = await database
        .collection('locations')
        .where('locationId', isEqualTo: locationId)
        .get();
    final querySnapshotId = querySnapshot.docs.first.id;

    return database
        .collection('locations')
        .doc(querySnapshotId)
        .collection('reviews')
        .add(newReview);
  }

  Future<void> addExistingReview({
    required Map<String, dynamic> newReview,
    required String locationId,
    required String user,
  }) async {
    final querySnapshot = await database
        .collection('locations')
        .where('locationId', isEqualTo: locationId)
        .get();
    final querySnapshotId = querySnapshot.docs.first.id;

    final reviewsSnapshot = await database
        .collection('locations')
        .doc(querySnapshotId)
        .collection('reviews')
        .where('user', isEqualTo: user)
        .get();

    if (reviewsSnapshot.docs.isNotEmpty) {
      final duplicatedReviewId = reviewsSnapshot.docs.first.id;
      await database
          .collection('locations')
          .doc(querySnapshotId)
          .collection('reviews')
          .doc(duplicatedReviewId)
          .set(newReview);
    } else {
      await addInitialReview(newReview: newReview, locationId: locationId);
    }
  }

  Future<List<ReviewEntity>> getLocationReviews({
    required String locationId,
  }) async {
    final querySnapshot = await database
        .collection('locations')
        .where('locationId', isEqualTo: locationId)
        .get();

    final querySnapshotId = querySnapshot.docs.first.id;

    final reviewsSnapshot = await database
        .collection('locations')
        .doc(querySnapshotId)
        .collection('reviews')
        .get();

    final reviews = reviewsSnapshot.docs
        .map((e) => ReviewEntity.fromJson(e.data()))
        .toList();

    return reviews;
  }

  Future<List<double>> getAverageLocationRating({
    required String locationId,
  }) async {
    final reviews = await getLocationReviews(locationId: locationId);

    final rates = <double>[];

    for (var i = 0; i < reviews.length; i++) {
      rates.add(reviews[i].rate);
    }

    final ratesSum = rates.fold<double>(
      0,
      (previousValue, element) => previousValue + element,
    );
    final ratesLength = rates.length;
    final averageRate = ratesSum / ratesLength;

    final list = <double>[];

    list.add(averageRate);
    list.add(ratesLength.toDouble());

    return list;
  }
}

@riverpod
ReviewsRepository reviewsRepository(ReviewsRepositoryRef ref) {
  return ReviewsRepository();
}

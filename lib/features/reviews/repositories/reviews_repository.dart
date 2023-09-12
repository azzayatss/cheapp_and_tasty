import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'reviews_repository.g.dart';

class ReviewsRepository {
  final database = FirebaseFirestore.instance;
  Future<DocumentReference<Map<String, dynamic>>> addReview({
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
}

@riverpod
ReviewsRepository reviewsRepository(ReviewsRepositoryRef ref) {
  return ReviewsRepository();
}

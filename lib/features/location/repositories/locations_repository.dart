import 'package:cheapp_and_tasty/features/location/entities/location_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'locations_repository.g.dart';

class LocationRepository {
  final database = FirebaseFirestore.instance;

  Future<DocumentReference<Map<String, dynamic>>> addLocation(
    Map<String, dynamic> locationData,
  ) async {
    return database.collection('locations').add(locationData);
  }

  Future<List<LocationEntity>> getAllLocations() async {
    final snapshot = await database.collection('locations').get();

    final locations =
        snapshot.docs.map((e) => LocationEntity.fromJson(e.data())).toList();

    return locations;
  }

  Future<void> updateLocationRate(
    String locationId,
    double averageRate,
  ) async {
    final querySnapshot = await database
        .collection('locations')
        .where('locationId', isEqualTo: locationId)
        .get();
    final querySnapshotId = querySnapshot.docs.first.id;

    final updatedRateMap = <String, dynamic>{'averageRate': averageRate};

    await database
        .collection('locations')
        .doc(querySnapshotId)
        .update(updatedRateMap);
  }
}

@riverpod
LocationRepository locationRepository(LocationRepositoryRef ref) {
  return LocationRepository();
}

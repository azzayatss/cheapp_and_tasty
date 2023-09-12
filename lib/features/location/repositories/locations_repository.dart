import 'package:cheapp_and_tasty/features/location/entities/location_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'locations_repository.g.dart';

class LocationRepository {
  final database = FirebaseFirestore.instance;

  Future<DocumentReference<Map<String, dynamic>>> addLocation(
    Map<String, dynamic> locationData,
  ) async {
    return  database.collection('locations').add(locationData);
  }

  // Future<LocationEntity> getLocationData() async {
  //   final result = await database
  //       .collection('locations')
  //       .doc('2RtIrJKh8e2JhrW6KodY')
  //       .get();

  //   return LocationEntity.fromJson(result.data()!);
  // }

  Future<List<LocationEntity>> getAllLocations() async {
    final snapshot = await database.collection('locations').get();

    final locations =
        snapshot.docs.map((e) => LocationEntity.fromJson(e.data())).toList();

    return locations;
  }

  Future<void> updateLocationRate(
    String locationId,
    Map<Object, Object?> newRates,
    Map<Object, Object?> newVotedPersons,
  ) async {
    final querySnapshot = await database
        .collection('locations')
        .where('locationId', isEqualTo: locationId)
        .get();
    final querySnapshotId = querySnapshot.docs.first.id;

    await database
        .collection('locations')
        .doc(querySnapshotId)
        .update(newRates);

    await database
        .collection('locations')
        .doc(querySnapshotId)
        .update(newVotedPersons);
  }
}

@riverpod
LocationRepository locationRepository(LocationRepositoryRef ref) {
  return LocationRepository();
}

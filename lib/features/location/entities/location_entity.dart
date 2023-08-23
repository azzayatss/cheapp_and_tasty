import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_entity.freezed.dart';
part 'location_entity.g.dart';

@freezed
class LocationEntity with _$LocationEntity {
  const factory LocationEntity({
    required String locationName,
    required String locationId,
    required String locationDescription,
    required double locationLatitude,
    required double locationLongitude,
    required String locationAdress,
    required String locationWorkingSchedule,
    required String locationReviews,
    required double locationRate,
    required String personWhoAddedLocation,
    required DateTime dateTimeWhenLocationAdded,
    required List<String> locationMenuImages,
    required List<String> locationImages,
    required List<String> additionalServicesChips,
    required String locationCoverPhoto,
  }) = _LocationEntity;

  factory LocationEntity.fromJson(Map<String, dynamic> json) =>
      _$LocationEntityFromJson(json);
}

//!

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'location_entity.freezed.dart';
// part 'location_entity.g.dart';

// @freezed
// abstract class LocationEntity implements _$LocationEntity {
//   const factory LocationEntity({
//     required String locationName,
//     required String locationId,
//     required String locationDescription,
//     required double locationLatitude,
//     required double locationLongitude,
//     required String locationAdress,
//     required String locationWorkingSchedule,
//     required String locationReviews,
//     required double locationRate,
//     required String personWhoAddedLocation,
//     required DateTime dateTimeWhenLocationAdded,
//     required List<String> locationMenuImages,
//     required List<String> locationImages,
//     required List<String> additionalServicesChips,
//     required String locationCoverPhoto,
//   }) = _LocationEntity;

//   factory LocationEntity.fromJson(Map<String, dynamic> json) =>
//       _$LocationEntityFromJson(json);
//   const LocationEntity._();

//   static LocationEntity fromDocument(DocumentSnapshot document) {
//     // if (document.data == null) return null;
//     final test = document.data();

//     return LocationEntity(
//       locationName: document.data['locationName'],
//       locationId: document.data['locationId'],
//       locationDescription: document.data['locationDescription'],
//       locationLatitude: document.data['locationLatitude'],
//       locationLongitude: document.data['locationLongitude'],
//       locationAdress: document.data['locationAdress'],
//       locationWorkingSchedule: document.data['locationWorkingSchedule'],
//       locationReviews: document.data['locationReviews'],
//       locationRate: document.data['locationRate'],
//       personWhoAddedLocation: document.data['personWhoAddedLocation'],
//       dateTimeWhenLocationAdded: document.data['dateTimeWhenLocationAdded'],
//       locationMenuImages: document.data['locationMenuImages'],
//       locationImages: document.data['locationImages'],
//       additionalServicesChips: document.data['additionalServicesChips'],
//       locationCoverPhoto: document.data['locationCoverPhoto'],
//     );
//   }
// }

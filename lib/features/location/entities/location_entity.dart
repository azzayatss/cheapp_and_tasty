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

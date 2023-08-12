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
    required bool doesLocationHaveDelivery,
    required bool doesLocationHaveTakeAway,
    required bool doesLocationHaveOwnParking,
    required bool doesLocationHaveCardPayments,
    required List<String> locationMenuImages,
  }) = _LocationEntity;

  factory LocationEntity.fromJson(Map<String, dynamic> json) =>
      _$LocationEntityFromJson(json);
}

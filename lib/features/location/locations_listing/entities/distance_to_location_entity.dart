import 'package:cheapp_and_tasty/features/location/locations_listing/entities/distance_location_entity.dart';
import 'package:cheapp_and_tasty/features/location/locations_listing/entities/duration_location_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'distance_to_location_entity.freezed.dart';
part 'distance_to_location_entity.g.dart';

@freezed
class DistanceToLocationEntity with _$DistanceToLocationEntity {
  const factory DistanceToLocationEntity({
    required DistanceLocationEntity distance,
    required DurationLocationEntity duration,
  }) = _DistanceToLocationEntity;

  factory DistanceToLocationEntity.fromJson(Map<String, dynamic> json) =>
      _$DistanceToLocationEntityFromJson(json);
}

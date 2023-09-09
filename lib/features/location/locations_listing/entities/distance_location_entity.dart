import 'package:freezed_annotation/freezed_annotation.dart';

part 'distance_location_entity.freezed.dart';
part 'distance_location_entity.g.dart';

@freezed
class DistanceLocationEntity with _$DistanceLocationEntity {
  const factory DistanceLocationEntity({
    @JsonKey(name: 'text') required String distance,
    @JsonKey(name: 'value') required int meters,
  }) = _DistanceLocationEntity;

  factory DistanceLocationEntity.fromJson(Map<String, dynamic> json) =>
      _$DistanceLocationEntityFromJson(json);
}

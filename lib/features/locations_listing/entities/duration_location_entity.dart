import 'package:freezed_annotation/freezed_annotation.dart';

part 'duration_location_entity.freezed.dart';
part 'duration_location_entity.g.dart';

@freezed
class DurationLocationEntity with _$DurationLocationEntity {
  const factory DurationLocationEntity({
    @JsonKey(name: 'text') required String timeToLocation,
    @JsonKey(name: 'value') required int secondsToLocation,
  }) = _DurationLocationEntity;

  factory DurationLocationEntity.fromJson(Map<String, dynamic> json) =>
      _$DurationLocationEntityFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_entity.freezed.dart';
part 'review_entity.g.dart';

@freezed
class ReviewEntity with _$ReviewEntity {
  const factory ReviewEntity({
    required String user,
    required double rate,
    required String comment,
    required DateTime creationDate,
  }) = _ReviewEntity;

  factory ReviewEntity.fromJson(Map<String, dynamic> json) =>
      _$ReviewEntityFromJson(json);
}

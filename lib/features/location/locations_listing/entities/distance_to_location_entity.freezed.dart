// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'distance_to_location_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DistanceToLocationEntity _$DistanceToLocationEntityFromJson(
    Map<String, dynamic> json) {
  return _DistanceToLocationEntity.fromJson(json);
}

/// @nodoc
mixin _$DistanceToLocationEntity {
  DistanceLocationEntity get distance => throw _privateConstructorUsedError;
  DurationLocationEntity get duration => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DistanceToLocationEntityCopyWith<DistanceToLocationEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DistanceToLocationEntityCopyWith<$Res> {
  factory $DistanceToLocationEntityCopyWith(DistanceToLocationEntity value,
          $Res Function(DistanceToLocationEntity) then) =
      _$DistanceToLocationEntityCopyWithImpl<$Res, DistanceToLocationEntity>;
  @useResult
  $Res call({DistanceLocationEntity distance, DurationLocationEntity duration});

  $DistanceLocationEntityCopyWith<$Res> get distance;
  $DurationLocationEntityCopyWith<$Res> get duration;
}

/// @nodoc
class _$DistanceToLocationEntityCopyWithImpl<$Res,
        $Val extends DistanceToLocationEntity>
    implements $DistanceToLocationEntityCopyWith<$Res> {
  _$DistanceToLocationEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? distance = null,
    Object? duration = null,
  }) {
    return _then(_value.copyWith(
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as DistanceLocationEntity,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as DurationLocationEntity,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DistanceLocationEntityCopyWith<$Res> get distance {
    return $DistanceLocationEntityCopyWith<$Res>(_value.distance, (value) {
      return _then(_value.copyWith(distance: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DurationLocationEntityCopyWith<$Res> get duration {
    return $DurationLocationEntityCopyWith<$Res>(_value.duration, (value) {
      return _then(_value.copyWith(duration: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_DistanceToLocationEntityCopyWith<$Res>
    implements $DistanceToLocationEntityCopyWith<$Res> {
  factory _$$_DistanceToLocationEntityCopyWith(
          _$_DistanceToLocationEntity value,
          $Res Function(_$_DistanceToLocationEntity) then) =
      __$$_DistanceToLocationEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DistanceLocationEntity distance, DurationLocationEntity duration});

  @override
  $DistanceLocationEntityCopyWith<$Res> get distance;
  @override
  $DurationLocationEntityCopyWith<$Res> get duration;
}

/// @nodoc
class __$$_DistanceToLocationEntityCopyWithImpl<$Res>
    extends _$DistanceToLocationEntityCopyWithImpl<$Res,
        _$_DistanceToLocationEntity>
    implements _$$_DistanceToLocationEntityCopyWith<$Res> {
  __$$_DistanceToLocationEntityCopyWithImpl(_$_DistanceToLocationEntity _value,
      $Res Function(_$_DistanceToLocationEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? distance = null,
    Object? duration = null,
  }) {
    return _then(_$_DistanceToLocationEntity(
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as DistanceLocationEntity,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as DurationLocationEntity,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DistanceToLocationEntity implements _DistanceToLocationEntity {
  const _$_DistanceToLocationEntity(
      {required this.distance, required this.duration});

  factory _$_DistanceToLocationEntity.fromJson(Map<String, dynamic> json) =>
      _$$_DistanceToLocationEntityFromJson(json);

  @override
  final DistanceLocationEntity distance;
  @override
  final DurationLocationEntity duration;

  @override
  String toString() {
    return 'DistanceToLocationEntity(distance: $distance, duration: $duration)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DistanceToLocationEntity &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, distance, duration);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DistanceToLocationEntityCopyWith<_$_DistanceToLocationEntity>
      get copyWith => __$$_DistanceToLocationEntityCopyWithImpl<
          _$_DistanceToLocationEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DistanceToLocationEntityToJson(
      this,
    );
  }
}

abstract class _DistanceToLocationEntity implements DistanceToLocationEntity {
  const factory _DistanceToLocationEntity(
          {required final DistanceLocationEntity distance,
          required final DurationLocationEntity duration}) =
      _$_DistanceToLocationEntity;

  factory _DistanceToLocationEntity.fromJson(Map<String, dynamic> json) =
      _$_DistanceToLocationEntity.fromJson;

  @override
  DistanceLocationEntity get distance;
  @override
  DurationLocationEntity get duration;
  @override
  @JsonKey(ignore: true)
  _$$_DistanceToLocationEntityCopyWith<_$_DistanceToLocationEntity>
      get copyWith => throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'distance_location_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DistanceLocationEntity _$DistanceLocationEntityFromJson(
    Map<String, dynamic> json) {
  return _DistanceLocationEntity.fromJson(json);
}

/// @nodoc
mixin _$DistanceLocationEntity {
  @JsonKey(name: 'text')
  String get distance => throw _privateConstructorUsedError;
  @JsonKey(name: 'value')
  int get meters => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DistanceLocationEntityCopyWith<DistanceLocationEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DistanceLocationEntityCopyWith<$Res> {
  factory $DistanceLocationEntityCopyWith(DistanceLocationEntity value,
          $Res Function(DistanceLocationEntity) then) =
      _$DistanceLocationEntityCopyWithImpl<$Res, DistanceLocationEntity>;
  @useResult
  $Res call(
      {@JsonKey(name: 'text') String distance,
      @JsonKey(name: 'value') int meters});
}

/// @nodoc
class _$DistanceLocationEntityCopyWithImpl<$Res,
        $Val extends DistanceLocationEntity>
    implements $DistanceLocationEntityCopyWith<$Res> {
  _$DistanceLocationEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? distance = null,
    Object? meters = null,
  }) {
    return _then(_value.copyWith(
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as String,
      meters: null == meters
          ? _value.meters
          : meters // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DistanceLocationEntityCopyWith<$Res>
    implements $DistanceLocationEntityCopyWith<$Res> {
  factory _$$_DistanceLocationEntityCopyWith(_$_DistanceLocationEntity value,
          $Res Function(_$_DistanceLocationEntity) then) =
      __$$_DistanceLocationEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'text') String distance,
      @JsonKey(name: 'value') int meters});
}

/// @nodoc
class __$$_DistanceLocationEntityCopyWithImpl<$Res>
    extends _$DistanceLocationEntityCopyWithImpl<$Res,
        _$_DistanceLocationEntity>
    implements _$$_DistanceLocationEntityCopyWith<$Res> {
  __$$_DistanceLocationEntityCopyWithImpl(_$_DistanceLocationEntity _value,
      $Res Function(_$_DistanceLocationEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? distance = null,
    Object? meters = null,
  }) {
    return _then(_$_DistanceLocationEntity(
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as String,
      meters: null == meters
          ? _value.meters
          : meters // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DistanceLocationEntity implements _DistanceLocationEntity {
  const _$_DistanceLocationEntity(
      {@JsonKey(name: 'text') required this.distance,
      @JsonKey(name: 'value') required this.meters});

  factory _$_DistanceLocationEntity.fromJson(Map<String, dynamic> json) =>
      _$$_DistanceLocationEntityFromJson(json);

  @override
  @JsonKey(name: 'text')
  final String distance;
  @override
  @JsonKey(name: 'value')
  final int meters;

  @override
  String toString() {
    return 'DistanceLocationEntity(distance: $distance, meters: $meters)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DistanceLocationEntity &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.meters, meters) || other.meters == meters));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, distance, meters);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DistanceLocationEntityCopyWith<_$_DistanceLocationEntity> get copyWith =>
      __$$_DistanceLocationEntityCopyWithImpl<_$_DistanceLocationEntity>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DistanceLocationEntityToJson(
      this,
    );
  }
}

abstract class _DistanceLocationEntity implements DistanceLocationEntity {
  const factory _DistanceLocationEntity(
          {@JsonKey(name: 'text') required final String distance,
          @JsonKey(name: 'value') required final int meters}) =
      _$_DistanceLocationEntity;

  factory _DistanceLocationEntity.fromJson(Map<String, dynamic> json) =
      _$_DistanceLocationEntity.fromJson;

  @override
  @JsonKey(name: 'text')
  String get distance;
  @override
  @JsonKey(name: 'value')
  int get meters;
  @override
  @JsonKey(ignore: true)
  _$$_DistanceLocationEntityCopyWith<_$_DistanceLocationEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

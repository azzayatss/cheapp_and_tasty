// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'duration_location_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DurationLocationEntity _$DurationLocationEntityFromJson(
    Map<String, dynamic> json) {
  return _DurationLocationEntity.fromJson(json);
}

/// @nodoc
mixin _$DurationLocationEntity {
  @JsonKey(name: 'text')
  String get timeToLocation => throw _privateConstructorUsedError;
  @JsonKey(name: 'value')
  int get secondsToLocation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DurationLocationEntityCopyWith<DurationLocationEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DurationLocationEntityCopyWith<$Res> {
  factory $DurationLocationEntityCopyWith(DurationLocationEntity value,
          $Res Function(DurationLocationEntity) then) =
      _$DurationLocationEntityCopyWithImpl<$Res, DurationLocationEntity>;
  @useResult
  $Res call(
      {@JsonKey(name: 'text') String timeToLocation,
      @JsonKey(name: 'value') int secondsToLocation});
}

/// @nodoc
class _$DurationLocationEntityCopyWithImpl<$Res,
        $Val extends DurationLocationEntity>
    implements $DurationLocationEntityCopyWith<$Res> {
  _$DurationLocationEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timeToLocation = null,
    Object? secondsToLocation = null,
  }) {
    return _then(_value.copyWith(
      timeToLocation: null == timeToLocation
          ? _value.timeToLocation
          : timeToLocation // ignore: cast_nullable_to_non_nullable
              as String,
      secondsToLocation: null == secondsToLocation
          ? _value.secondsToLocation
          : secondsToLocation // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DurationLocationEntityCopyWith<$Res>
    implements $DurationLocationEntityCopyWith<$Res> {
  factory _$$_DurationLocationEntityCopyWith(_$_DurationLocationEntity value,
          $Res Function(_$_DurationLocationEntity) then) =
      __$$_DurationLocationEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'text') String timeToLocation,
      @JsonKey(name: 'value') int secondsToLocation});
}

/// @nodoc
class __$$_DurationLocationEntityCopyWithImpl<$Res>
    extends _$DurationLocationEntityCopyWithImpl<$Res,
        _$_DurationLocationEntity>
    implements _$$_DurationLocationEntityCopyWith<$Res> {
  __$$_DurationLocationEntityCopyWithImpl(_$_DurationLocationEntity _value,
      $Res Function(_$_DurationLocationEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timeToLocation = null,
    Object? secondsToLocation = null,
  }) {
    return _then(_$_DurationLocationEntity(
      timeToLocation: null == timeToLocation
          ? _value.timeToLocation
          : timeToLocation // ignore: cast_nullable_to_non_nullable
              as String,
      secondsToLocation: null == secondsToLocation
          ? _value.secondsToLocation
          : secondsToLocation // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DurationLocationEntity implements _DurationLocationEntity {
  const _$_DurationLocationEntity(
      {@JsonKey(name: 'text') required this.timeToLocation,
      @JsonKey(name: 'value') required this.secondsToLocation});

  factory _$_DurationLocationEntity.fromJson(Map<String, dynamic> json) =>
      _$$_DurationLocationEntityFromJson(json);

  @override
  @JsonKey(name: 'text')
  final String timeToLocation;
  @override
  @JsonKey(name: 'value')
  final int secondsToLocation;

  @override
  String toString() {
    return 'DurationLocationEntity(timeToLocation: $timeToLocation, secondsToLocation: $secondsToLocation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DurationLocationEntity &&
            (identical(other.timeToLocation, timeToLocation) ||
                other.timeToLocation == timeToLocation) &&
            (identical(other.secondsToLocation, secondsToLocation) ||
                other.secondsToLocation == secondsToLocation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, timeToLocation, secondsToLocation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DurationLocationEntityCopyWith<_$_DurationLocationEntity> get copyWith =>
      __$$_DurationLocationEntityCopyWithImpl<_$_DurationLocationEntity>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DurationLocationEntityToJson(
      this,
    );
  }
}

abstract class _DurationLocationEntity implements DurationLocationEntity {
  const factory _DurationLocationEntity(
          {@JsonKey(name: 'text') required final String timeToLocation,
          @JsonKey(name: 'value') required final int secondsToLocation}) =
      _$_DurationLocationEntity;

  factory _DurationLocationEntity.fromJson(Map<String, dynamic> json) =
      _$_DurationLocationEntity.fromJson;

  @override
  @JsonKey(name: 'text')
  String get timeToLocation;
  @override
  @JsonKey(name: 'value')
  int get secondsToLocation;
  @override
  @JsonKey(ignore: true)
  _$$_DurationLocationEntityCopyWith<_$_DurationLocationEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

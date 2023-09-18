// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReviewEntity _$ReviewEntityFromJson(Map<String, dynamic> json) {
  return _ReviewEntity.fromJson(json);
}

/// @nodoc
mixin _$ReviewEntity {
  String get user => throw _privateConstructorUsedError;
  double get rate => throw _privateConstructorUsedError;
  String get comment => throw _privateConstructorUsedError;
  DateTime get creationDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReviewEntityCopyWith<ReviewEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewEntityCopyWith<$Res> {
  factory $ReviewEntityCopyWith(
          ReviewEntity value, $Res Function(ReviewEntity) then) =
      _$ReviewEntityCopyWithImpl<$Res, ReviewEntity>;
  @useResult
  $Res call({String user, double rate, String comment, DateTime creationDate});
}

/// @nodoc
class _$ReviewEntityCopyWithImpl<$Res, $Val extends ReviewEntity>
    implements $ReviewEntityCopyWith<$Res> {
  _$ReviewEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? rate = null,
    Object? comment = null,
    Object? creationDate = null,
  }) {
    return _then(_value.copyWith(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      creationDate: null == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReviewEntityCopyWith<$Res>
    implements $ReviewEntityCopyWith<$Res> {
  factory _$$_ReviewEntityCopyWith(
          _$_ReviewEntity value, $Res Function(_$_ReviewEntity) then) =
      __$$_ReviewEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String user, double rate, String comment, DateTime creationDate});
}

/// @nodoc
class __$$_ReviewEntityCopyWithImpl<$Res>
    extends _$ReviewEntityCopyWithImpl<$Res, _$_ReviewEntity>
    implements _$$_ReviewEntityCopyWith<$Res> {
  __$$_ReviewEntityCopyWithImpl(
      _$_ReviewEntity _value, $Res Function(_$_ReviewEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? rate = null,
    Object? comment = null,
    Object? creationDate = null,
  }) {
    return _then(_$_ReviewEntity(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      creationDate: null == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReviewEntity implements _ReviewEntity {
  const _$_ReviewEntity(
      {required this.user,
      required this.rate,
      required this.comment,
      required this.creationDate});

  factory _$_ReviewEntity.fromJson(Map<String, dynamic> json) =>
      _$$_ReviewEntityFromJson(json);

  @override
  final String user;
  @override
  final double rate;
  @override
  final String comment;
  @override
  final DateTime creationDate;

  @override
  String toString() {
    return 'ReviewEntity(user: $user, rate: $rate, comment: $comment, creationDate: $creationDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReviewEntity &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.creationDate, creationDate) ||
                other.creationDate == creationDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, user, rate, comment, creationDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReviewEntityCopyWith<_$_ReviewEntity> get copyWith =>
      __$$_ReviewEntityCopyWithImpl<_$_ReviewEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReviewEntityToJson(
      this,
    );
  }
}

abstract class _ReviewEntity implements ReviewEntity {
  const factory _ReviewEntity(
      {required final String user,
      required final double rate,
      required final String comment,
      required final DateTime creationDate}) = _$_ReviewEntity;

  factory _ReviewEntity.fromJson(Map<String, dynamic> json) =
      _$_ReviewEntity.fromJson;

  @override
  String get user;
  @override
  double get rate;
  @override
  String get comment;
  @override
  DateTime get creationDate;
  @override
  @JsonKey(ignore: true)
  _$$_ReviewEntityCopyWith<_$_ReviewEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

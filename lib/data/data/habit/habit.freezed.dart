// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'habit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HabitData _$HabitDataFromJson(Map<String, dynamic> json) {
  return _HabitData.fromJson(json);
}

/// @nodoc
mixin _$HabitData {
  /// Unique habit ID
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;

  /// Habit name
  @HiveField(1)
  String get name => throw _privateConstructorUsedError;

  /// Habit category  id
  @HiveField(2)
  String get categoryId => throw _privateConstructorUsedError; // Timestamps
  /// Habit creation timestamp
  @HiveField(5)
  int get createdAt => throw _privateConstructorUsedError;

  /// Timestamp for Habit updates
  @HiveField(6)
  int get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this HabitData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HabitData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HabitDataCopyWith<HabitData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HabitDataCopyWith<$Res> {
  factory $HabitDataCopyWith(HabitData value, $Res Function(HabitData) then) =
      _$HabitDataCopyWithImpl<$Res, HabitData>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String name,
      @HiveField(2) String categoryId,
      @HiveField(5) int createdAt,
      @HiveField(6) int updatedAt});
}

/// @nodoc
class _$HabitDataCopyWithImpl<$Res, $Val extends HabitData>
    implements $HabitDataCopyWith<$Res> {
  _$HabitDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HabitData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? categoryId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HabitDataImplCopyWith<$Res>
    implements $HabitDataCopyWith<$Res> {
  factory _$$HabitDataImplCopyWith(
          _$HabitDataImpl value, $Res Function(_$HabitDataImpl) then) =
      __$$HabitDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String name,
      @HiveField(2) String categoryId,
      @HiveField(5) int createdAt,
      @HiveField(6) int updatedAt});
}

/// @nodoc
class __$$HabitDataImplCopyWithImpl<$Res>
    extends _$HabitDataCopyWithImpl<$Res, _$HabitDataImpl>
    implements _$$HabitDataImplCopyWith<$Res> {
  __$$HabitDataImplCopyWithImpl(
      _$HabitDataImpl _value, $Res Function(_$HabitDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of HabitData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? categoryId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$HabitDataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 1, adapterName: 'HabitDataAdapter')
class _$HabitDataImpl extends _HabitData {
  const _$HabitDataImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.name,
      @HiveField(2) required this.categoryId,
      @HiveField(5) required this.createdAt,
      @HiveField(6) required this.updatedAt})
      : super._();

  factory _$HabitDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$HabitDataImplFromJson(json);

  /// Unique habit ID
  @override
  @HiveField(0)
  final String id;

  /// Habit name
  @override
  @HiveField(1)
  final String name;

  /// Habit category  id
  @override
  @HiveField(2)
  final String categoryId;
// Timestamps
  /// Habit creation timestamp
  @override
  @HiveField(5)
  final int createdAt;

  /// Timestamp for Habit updates
  @override
  @HiveField(6)
  final int updatedAt;

  @override
  String toString() {
    return 'HabitData(id: $id, name: $name, categoryId: $categoryId, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HabitDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, categoryId, createdAt, updatedAt);

  /// Create a copy of HabitData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HabitDataImplCopyWith<_$HabitDataImpl> get copyWith =>
      __$$HabitDataImplCopyWithImpl<_$HabitDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HabitDataImplToJson(
      this,
    );
  }
}

abstract class _HabitData extends HabitData {
  const factory _HabitData(
      {@HiveField(0) required final String id,
      @HiveField(1) required final String name,
      @HiveField(2) required final String categoryId,
      @HiveField(5) required final int createdAt,
      @HiveField(6) required final int updatedAt}) = _$HabitDataImpl;
  const _HabitData._() : super._();

  factory _HabitData.fromJson(Map<String, dynamic> json) =
      _$HabitDataImpl.fromJson;

  /// Unique habit ID
  @override
  @HiveField(0)
  String get id;

  /// Habit name
  @override
  @HiveField(1)
  String get name;

  /// Habit category  id
  @override
  @HiveField(2)
  String get categoryId; // Timestamps
  /// Habit creation timestamp
  @override
  @HiveField(5)
  int get createdAt;

  /// Timestamp for Habit updates
  @override
  @HiveField(6)
  int get updatedAt;

  /// Create a copy of HabitData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HabitDataImplCopyWith<_$HabitDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HabitRecordData _$HabitRecordDataFromJson(Map<String, dynamic> json) {
  return _HabitRecordData.fromJson(json);
}

/// @nodoc
mixin _$HabitRecordData {
  ///  Habit ID
  @HiveField(0)
  String get habitId => throw _privateConstructorUsedError;

  /// Habit completed for the date
  @HiveField(1)
  int get date => throw _privateConstructorUsedError;

  /// Habit record created on
  @HiveField(2)
  int get createdAt => throw _privateConstructorUsedError;

  /// Serializes this HabitRecordData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HabitRecordData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HabitRecordDataCopyWith<HabitRecordData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HabitRecordDataCopyWith<$Res> {
  factory $HabitRecordDataCopyWith(
          HabitRecordData value, $Res Function(HabitRecordData) then) =
      _$HabitRecordDataCopyWithImpl<$Res, HabitRecordData>;
  @useResult
  $Res call(
      {@HiveField(0) String habitId,
      @HiveField(1) int date,
      @HiveField(2) int createdAt});
}

/// @nodoc
class _$HabitRecordDataCopyWithImpl<$Res, $Val extends HabitRecordData>
    implements $HabitRecordDataCopyWith<$Res> {
  _$HabitRecordDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HabitRecordData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? habitId = null,
    Object? date = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      habitId: null == habitId
          ? _value.habitId
          : habitId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HabitRecordDataImplCopyWith<$Res>
    implements $HabitRecordDataCopyWith<$Res> {
  factory _$$HabitRecordDataImplCopyWith(_$HabitRecordDataImpl value,
          $Res Function(_$HabitRecordDataImpl) then) =
      __$$HabitRecordDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String habitId,
      @HiveField(1) int date,
      @HiveField(2) int createdAt});
}

/// @nodoc
class __$$HabitRecordDataImplCopyWithImpl<$Res>
    extends _$HabitRecordDataCopyWithImpl<$Res, _$HabitRecordDataImpl>
    implements _$$HabitRecordDataImplCopyWith<$Res> {
  __$$HabitRecordDataImplCopyWithImpl(
      _$HabitRecordDataImpl _value, $Res Function(_$HabitRecordDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of HabitRecordData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? habitId = null,
    Object? date = null,
    Object? createdAt = null,
  }) {
    return _then(_$HabitRecordDataImpl(
      habitId: null == habitId
          ? _value.habitId
          : habitId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 2, adapterName: 'HabitRecordDataAdapter')
class _$HabitRecordDataImpl extends _HabitRecordData {
  const _$HabitRecordDataImpl(
      {@HiveField(0) required this.habitId,
      @HiveField(1) required this.date,
      @HiveField(2) required this.createdAt})
      : super._();

  factory _$HabitRecordDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$HabitRecordDataImplFromJson(json);

  ///  Habit ID
  @override
  @HiveField(0)
  final String habitId;

  /// Habit completed for the date
  @override
  @HiveField(1)
  final int date;

  /// Habit record created on
  @override
  @HiveField(2)
  final int createdAt;

  @override
  String toString() {
    return 'HabitRecordData(habitId: $habitId, date: $date, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HabitRecordDataImpl &&
            (identical(other.habitId, habitId) || other.habitId == habitId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, habitId, date, createdAt);

  /// Create a copy of HabitRecordData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HabitRecordDataImplCopyWith<_$HabitRecordDataImpl> get copyWith =>
      __$$HabitRecordDataImplCopyWithImpl<_$HabitRecordDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HabitRecordDataImplToJson(
      this,
    );
  }
}

abstract class _HabitRecordData extends HabitRecordData {
  const factory _HabitRecordData(
      {@HiveField(0) required final String habitId,
      @HiveField(1) required final int date,
      @HiveField(2) required final int createdAt}) = _$HabitRecordDataImpl;
  const _HabitRecordData._() : super._();

  factory _HabitRecordData.fromJson(Map<String, dynamic> json) =
      _$HabitRecordDataImpl.fromJson;

  ///  Habit ID
  @override
  @HiveField(0)
  String get habitId;

  /// Habit completed for the date
  @override
  @HiveField(1)
  int get date;

  /// Habit record created on
  @override
  @HiveField(2)
  int get createdAt;

  /// Create a copy of HabitRecordData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HabitRecordDataImplCopyWith<_$HabitRecordDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

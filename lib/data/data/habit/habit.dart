import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'habit.freezed.dart';
part 'habit.g.dart';

///  Habit Data class
@freezed
class HabitData with _$HabitData {
  const HabitData._();

  @HiveType(typeId: 1, adapterName: 'HabitDataAdapter')
  const factory HabitData({
    /// Unique habit ID
    @HiveField(0) required String id,

    /// Habit name
    @HiveField(1) required String name,

    /// Habit category  id
    @HiveField(2) required String categoryId,

    // Timestamps
    /// Habit creation timestamp
    @HiveField(5) required int createdAt,

    /// Timestamp for Habit updates
    @HiveField(6) required int updatedAt,
  }) = _HabitData;

  factory HabitData.fromJson(Map<String, dynamic> json) =>
      _$HabitDataFromJson(json);
}

///  Habit Record Data
@freezed
class HabitRecordData with _$HabitRecordData {
  const HabitRecordData._();

  @HiveType(typeId: 2, adapterName: 'HabitRecordDataAdapter')
  const factory HabitRecordData({
    ///  Habit ID
    @HiveField(0) required String habitId,

    /// Habit completed for the date
    @HiveField(1) required int date,

    /// Habit record created on
    @HiveField(2) required int createdAt,
  }) = _HabitRecordData;

  factory HabitRecordData.fromJson(Map<String, dynamic> json) =>
      _$HabitRecordDataFromJson(json);

  /// Record ID - For a given date, there will be only one record
  int get id {
    final dateTime = DateTime.fromMillisecondsSinceEpoch(date);

    final onlyData = DateTime(dateTime.year, dateTime.month, dateTime.day);

    return onlyData.millisecondsSinceEpoch;
  }
}

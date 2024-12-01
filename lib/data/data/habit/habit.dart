import 'package:flutter/material.dart';
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
    @HiveField(2) required HabitCategory category,

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
  String get id {
    final dateTime = DateTime.fromMillisecondsSinceEpoch(date);

    final onlyData = DateTime(dateTime.year, dateTime.month, dateTime.day);

    return "${habitId}_${onlyData.millisecondsSinceEpoch}";
  }
}

/// Habit Category
@HiveType(typeId: 3)
enum HabitCategory {
  @HiveField(0)
  sports(Icons.sports_soccer, Colors.green),
  @HiveField(1)
  health(Icons.local_hospital, Colors.red),
  @HiveField(2)
  work(Icons.work, Colors.blue),
  @HiveField(3)
  study(Icons.book, Colors.purple),
  @HiveField(4)
  food(Icons.fastfood, Colors.orange),
  @HiveField(5)
  finance(Icons.monetization_on, Colors.yellow),
  @HiveField(6)
  yoga(Icons.self_improvement, Colors.pink),
  @HiveField(7)
  social(Icons.people, Colors.teal),
  @HiveField(8)
  fun(Icons.emoji_emotions, Colors.deepPurple),
  @HiveField(9)
  outdoors(Icons.nature_people, Colors.green),
  @HiveField(10)
  reading(Icons.menu_book, Colors.blue),
  @HiveField(11)
  others(Icons.grid_view_rounded, Colors.grey);

  final IconData icon;
  final Color color;

  const HabitCategory(this.icon, this.color);
}

import 'package:flutter/foundation.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:rise/data/api/hive/service_extension.dart';
import 'package:rise/data/command/commands.dart';
import 'package:rise/data/utils/string_utils.dart';
import 'package:rise/data/utils/time_utils.dart';

import '../../data/habit/habit.dart';

class HabitsCommand extends BaseAppCommand {
  /// get habits listenable (Temp solution for local)
  ValueListenable<Box<HabitData>> get habitDataListenable =>
      hive.habitBox.listenable();

  ///  Habit Record Listenable
  ///  Temp solution for, optimise this  logic  to listening to habit specific records
  ValueListenable<Box<HabitRecordData>> habitRecordDataListenable(
    String habitId,
    DateTime dateTime,
  ) {
    final recordId = HabitRecordData(
      habitId: habitId,
      date: dateTime.millisecondsSinceEpoch,
      createdAt: TimeUtils.nowMillis,
    ).id;

    return hive.habitRecordBox.listenable(keys: [recordId]);
  }

  /// Add / Update habit
  void addHabit({
    String? id,
    required String name,
    required HabitCategory category,
  }) {
    final habitData = HabitData(
      id: id ?? StringUtils.uniqueId,
      name: name,
      category: category,
      createdAt: TimeUtils.nowMillis,
      updatedAt: TimeUtils.nowMillis,
    );

    hive.addHabit(habitData);
  }

  /// check if the habit is complete on the given date
  bool isHabitComplete(String habitId, DateTime date) {
    final habitRecord = HabitRecordData(
      habitId: habitId,
      date: date.millisecondsSinceEpoch,
      createdAt: TimeUtils.nowMillis,
    );

    return hive.habitRecordBox.containsKey(habitRecord.id);
  }

  /// Add  Habit Record
  void addHabitRecord(String habitId, DateTime date) {
    final habitRecord = HabitRecordData(
      habitId: habitId,
      date: date.millisecondsSinceEpoch,
      createdAt: TimeUtils.nowMillis,
    );

    hive.addHabitRecord(habitRecord);
  }

  /// Delete Habit Record
  void deleteHabitRecord(String habitId, DateTime date) {
    final habitRecord = HabitRecordData(
      habitId: habitId,
      date: date.millisecondsSinceEpoch,
      createdAt: TimeUtils.nowMillis,
    );

    hive.deleteHabitRecord(habitRecord.id);
  }
}

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
}

import 'package:flutter/material.dart';

import '../../../data/command/habit/habits_command.dart';

/// Date Record Listenable
class DateRecordListenable extends StatelessWidget {
  final DateTime date;
  final String habitId;
  final Widget Function(bool isCompleted) dateBuilder;

  const DateRecordListenable({
    super.key,
    required this.date,
    required this.habitId,
    required this.dateBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: HabitsCommand().habitRecordDataListenable(habitId, date),
      builder: (_, __, ___) {
        final isCompleted = HabitsCommand().isHabitComplete(habitId, date);

        return GestureDetector(
          onTap: () {
            if (isCompleted) {
              HabitsCommand().deleteHabitRecord(habitId, date);
            } else {
              HabitsCommand().addHabitRecord(habitId, date);
            }
          },
          child: dateBuilder(isCompleted),
        );
      },
    );
  }
}

import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:rise/data/data/habit/habit.dart';
import 'package:rise/theme.dart';

import '../../../data/utils/string_utils.dart';
import 'date_record_listenable.dart';

/// habit list card
class HabitListViewCard extends StatelessWidget {
  final HabitData data;

  const HabitListViewCard({
    super.key,
    required this.data,
  });

  static final _today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    final cardColor = data.category.color.harmonizeWith(colorScheme.primary);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            cardColor.withAlpha(80),
            // cardColor.withOpacity(0.4),
            cardColor.withAlpha(16),
          ],
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,

            /// Habit Icon
            leading: CircleAvatar(
              radius: 24,
              backgroundColor: data.category.color.withAlpha(100),
              child: Icon(data.category.icon),
            ),

            /// Habit Title
            title: Text(data.name),

            /// Habit more options
            trailing: CircleAvatar(
              backgroundColor: cardColor.withAlpha(44),
              radius: 12,
              child: Icon(
                Icons.more_horiz,
                size: 16,
                color: cardColor.withAlpha(96),
              ),
            ),
          ),

          /// dates
          Container(
            margin: const EdgeInsets.only(top: 8.0),
            width: double.infinity,
            height: 72,
            child: ListView.builder(
              reverse: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                final date = _today.subtract(Duration(days: index));

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DateTile(
                    color: data.category.color,
                    date: date,
                    habitId: data.id,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

/// Date Tile
class DateTile extends StatelessWidget {
  final Color color;
  final DateTime date;
  final String habitId;

  const DateTile({
    super.key,
    required this.color,
    required this.date,
    required this.habitId,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final textTheme = context.textTheme;

    return DateRecordListenable(
      date: date,
      habitId: habitId,
      dateBuilder: (isCompleted) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Day of the week
            Text(
              StringUtils.getWeekDay(date),
              style: textTheme.labelSmall?.copyWith(
                fontWeight: FontWeight.w300,
              ),
            ),

            /// Date - Border Container
            Container(
              height: 28,
              width: 28,
              margin: const EdgeInsets.only(top: 7.0),
              decoration: BoxDecoration(
                color: isCompleted
                    ? color.withAlpha(80)
                    : colorScheme.surface.withAlpha(80),
                shape: BoxShape.circle,
                border: Border.all(
                  color:
                      isCompleted ? color : colorScheme.onSurface.withAlpha(80),
                ),
              ),
              child: Center(
                child: Text(
                  date.day.toString(),
                  style: textTheme.labelSmall?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

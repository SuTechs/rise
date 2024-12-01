import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:rise/screens/habits/components/date_record_listenable.dart';
import 'package:rise/theme.dart';

import '../../../data/data/habit/habit.dart';

/// habit list card
class HabitGridviewCard extends StatelessWidget {
  final HabitData data;

  const HabitGridviewCard({super.key, required this.data});

  static final _today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    final cardColor = data.category.color.harmonizeWith(colorScheme.primary);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: cardColor.withAlpha(80),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,

            /// Habit Icon
            leading: Icon(data.category.icon, color: data.category.color),

            /// Habit Title
            title: Text(data.name),

            /// Habit more options

            trailing: DateRecordListenable(
              date: _today,
              habitId: data.id,
              dateBuilder: (isCompleted) {
                return Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: isCompleted
                        ? cardColor.withAlpha(80)
                        : colorScheme.surface.withAlpha(80),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isCompleted
                          ? cardColor
                          : colorScheme.onSurface.withAlpha(80),
                    ),
                  ),
                  child: const Icon(Icons.done, size: 16),
                );
              },
            ),
          ),

          /// dates
          Container(
            margin: const EdgeInsets.only(top: 4.0, bottom: 12.0),
            width: double.infinity,
            height: 100,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
              ),
              reverse: true,
              scrollDirection: Axis.horizontal,
              itemCount: 30,
              itemBuilder: (_, index) {
                final date = _today.subtract(Duration(days: index));

                return DateRecordListenable(
                  date: date,
                  habitId: data.id,
                  dateBuilder: (isCompleted) {
                    /// yearly heat map tile
                    return Container(
                      height: 4,
                      width: 4,
                      decoration: BoxDecoration(
                        color: isCompleted
                            ? cardColor.withAlpha(160)
                            : cardColor.withAlpha(32),
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

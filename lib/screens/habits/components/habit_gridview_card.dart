import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:rise/theme.dart';

import '../../../data/utils/string_utils.dart';

/// habit list card
class HabitGridviewCard extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String title;

  const HabitGridviewCard({
    super.key,
    required this.color,
    required this.icon,
    required this.title,
  });

  static final _today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    final cardColor = color.harmonizeWith(colorScheme.primary);
    final isCompleted = StringUtils.random(0, 2) == 1;

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
            leading: Icon(icon, color: color),

            /// Habit Title
            title: Text(title),

            /// Habit more options
            trailing: Container(
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
              itemBuilder: (_, index) {
                final date = _today.subtract(Duration(days: index));

                final isCompleted = StringUtils.random(0, 2) == 1;

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
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:rise/data/command/habit/habits_command.dart';

import 'add_habit_screen.dart';
import 'components/habit_gridview_card.dart';
import 'components/habit_listview_card.dart';

class HabitsScreen extends StatelessWidget {
  const HabitsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        /// Tab Bar -  Week View and Grid View
        appBar: AppBar(
          // toolbarHeight: 80,
          titleSpacing: 0,
          title: const TabBar(
            tabs: [
              Tab(
                text: 'Week View',
                // icon: Icon(Icons.view_week),
              ),
              Tab(
                text: 'Grid View',
                // icon: Icon(Icons.grid_view),
              ),
            ],
          ),
        ),

        /// Habit List View
        body: const TabBarView(
          children: [
            /// Week View
            HabitList(),

            /// Grid View
            HabitList(isGridView: true),
          ],
        ),

        /// Add New Habit Button
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const AddHabitScreen();
                },
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

/// Habit List
class HabitList extends StatelessWidget {
  final bool isGridView;

  const HabitList({
    super.key,
    this.isGridView = false,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: HabitsCommand().habitDataListenable,
      builder: (context, box, child) {
        return ListView.builder(
          itemCount: box.length,
          itemBuilder: (context, index) {
            final habit = box.values.elementAt(index);

            final habitName = habit.name;
            final habitIcon = habit.category.icon;
            final habitColor = habit.category.color;

            return isGridView
                ? HabitGridviewCard(
                    color: habitColor,
                    icon: habitIcon,
                    title: habitName,
                  )
                : HabitListViewCard(
                    color: habitColor,
                    icon: habitIcon,
                    title: habitName,
                  );
          },
        );
      },
    );
  }
}

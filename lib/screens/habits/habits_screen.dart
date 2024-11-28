import 'package:flutter/material.dart';

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
        body: TabBarView(
          children: [
            /// Week View
            ListView(
              children: const [
                HabitListViewCard(
                  color: Colors.purple,
                  icon: Icons.directions_run,
                  title: 'Running for 2 kms',
                ),
                HabitListViewCard(
                  color: Colors.brown,
                  icon: Icons.self_improvement,
                  title: 'Meditation',
                ),
                HabitListViewCard(
                  color: Colors.green,
                  icon: Icons.local_drink,
                  title: 'Drink 2 litres of water',
                ),
                HabitListViewCard(
                  color: Colors.blue,
                  icon: Icons.local_cafe,
                  title: 'No Coffee',
                ),
              ],
            ),

            /// Grid View
            ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return const HabitGridviewCard();
              },
            ),
          ],
        ),

        /// Add New Habit Button
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Navigator.pushNamed(context, '/add-habit');
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

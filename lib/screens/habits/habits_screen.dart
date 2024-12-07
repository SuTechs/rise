import 'package:flutter/material.dart';
import 'package:rise/data/command/habit/habits_command.dart';

import 'add_habit_screen.dart';
import 'components/habit_gridview_card.dart';
import 'components/habit_listview_card.dart';

// class HabitsScreen extends StatelessWidget {
//   const HabitsScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         /// Tab Bar -  Week View and Grid View
//         appBar: AppBar(
//           // toolbarHeight: 80,
//           titleSpacing: 0,
//           title: const TabBar(
//             tabs: [
//               Tab(
//                 text: 'Week View',
//                 // icon: Icon(Icons.view_week),
//               ),
//               Tab(
//                 text: 'Grid View',
//                 // icon: Icon(Icons.grid_view),
//               ),
//             ],
//           ),
//         ),
//
//         /// Habit List View
//         body: const TabBarView(
//           children: [
//             /// Week View
//             HabitList(),
//
//             /// Grid View
//             HabitList(isGridView: true),
//           ],
//         ),
//
//         /// Add New Habit Button
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) {
//                   return const AddHabitScreen();
//                 },
//               ),
//             );
//           },
//           child: const Icon(Icons.add),
//         ),
//       ),
//     );
//   }
// }


class HabitsScreen extends StatefulWidget {
  const HabitsScreen({super.key});

  @override
  State<HabitsScreen> createState() => _HabitsScreenState();
}

class _HabitsScreenState extends State<HabitsScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ToggleButtons(
              isSelected: [_selectedIndex == 0, _selectedIndex == 1],
              onPressed: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              constraints: const BoxConstraints(minHeight: 36, minWidth: 100),
              borderRadius: BorderRadius.circular(8),
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text('Week View'),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text('Grid View'),
                ),
              ],
            ),
          ],
        ),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: const [
          /// Week View
          HabitList(),

          /// Grid View
          HabitList(isGridView: true),
        ],
      ),
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

            return isGridView
                ? HabitGridviewCard(data: habit)
                : HabitListViewCard(data: habit);
          },
        );
      },
    );
  }
}

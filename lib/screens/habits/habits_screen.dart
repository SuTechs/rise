import 'package:flutter/material.dart';
import 'package:rise/data/command/habit/habits_command.dart';
import 'package:rise/theme.dart';

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
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onTogglePressed(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ToggleButtons(
              isSelected: [_selectedIndex == 0, _selectedIndex == 1],
              onPressed: _onTogglePressed,
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
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
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
        if (box.length == 0) {
          return GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const AddHabitScreen();
                  },
                ),
              );
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/yoga_women2.png",
                  width: 240,
                  height: 240,
                  fit: BoxFit.cover,
                ),
                Text(
                  "+ Create a habit",
                  style: context.textTheme.headlineSmall,
                ),
              ],
            ),
          );
        }
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

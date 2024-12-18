import 'package:flutter/material.dart';
import 'package:rise/widgets/save_page_state.dart';

import 'habits/habits_screen.dart';
import 'pomodoro/pomodoro_screen.dart';
import 'settings/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const pages = [
    SavePageSate(child: HabitsScreen()),
    SavePageSate(child: PomodoroScreen()),
    SavePageSate(child: SettingsScreen()),
  ];

  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: pages,
      ),

      /// Bottom Navigation Bar
      bottomNavigationBar: _BottomNavigationBar(
        onTabTapped: (index) {
          _pageController.jumpToPage(index);
        },
      ),
    );
  }
}

/// Bottom Navigation Bar
class _BottomNavigationBar extends StatefulWidget {
  const _BottomNavigationBar({required this.onTabTapped});

  final void Function(int) onTabTapped;

  @override
  State<_BottomNavigationBar> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<_BottomNavigationBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: _currentIndex == 0 ? true : false,
      onPopInvokedWithResult: (didPop, _) {
        widget.onTabTapped(0);
        setState(() {
          _currentIndex = 0;
        });
      },
      child: BottomNavigationBar(
        onTap: (index) {
          widget.onTabTapped(index);
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,

        /// Bottom Navigation Bar Items
        items: const [
          /// Habits
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Habits',
          ),

          /// Pomodoro
          BottomNavigationBarItem(
            icon: Icon(Icons.timer_outlined),
            activeIcon: Icon(Icons.timer),
            label: 'Pomodoro',
          ),

          /// Settings
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            activeIcon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

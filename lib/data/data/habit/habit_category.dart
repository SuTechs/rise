import 'package:flutter/material.dart';

class HabitCategory {
  //  for now name is id, since everything is local
  final String name;
  final IconData icon;
  final Color color;

  const HabitCategory({
    required this.name,
    required this.icon,
    required this.color,
  });

  static const categories = [
    // sports
    HabitCategory(
      name: 'Sports',
      icon: Icons.sports_soccer,
      color: Colors.green,
    ),

    // Health
    HabitCategory(
      name: 'Health',
      icon: Icons.local_hospital,
      color: Colors.red,
    ),

    // Work
    HabitCategory(
      name: 'Work',
      icon: Icons.work,
      color: Colors.blue,
    ),

    // Study
    HabitCategory(
      name: 'Study',
      icon: Icons.book,
      color: Colors.purple,
    ),

    // Food
    HabitCategory(
      name: 'Food',
      icon: Icons.fastfood,
      color: Colors.orange,
    ),

    // Finance
    HabitCategory(
      name: 'Finance',
      icon: Icons.monetization_on,
      color: Colors.yellow,
    ),

    // Yoga
    HabitCategory(
      name: 'Yoga',
      icon: Icons.self_improvement,
      color: Colors.pink,
    ),

    // Social
    HabitCategory(
      name: 'Social',
      icon: Icons.people,
      color: Colors.teal,
    ),

    // Fun
    HabitCategory(
      name: 'Fun',
      icon: Icons.emoji_emotions,
      color: Colors.deepPurple,
    ),

    // Outdoors
    HabitCategory(
      name: 'Outdoors',
      icon: Icons.nature_people,
      color: Colors.green,
    ),

    // Reading
    HabitCategory(
      name: 'Reading',
      icon: Icons.menu_book,
      color: Colors.blue,
    ),

    // Others
    HabitCategory(
      name: 'Others',
      icon: Icons.grid_view_rounded,
      color: Colors.grey,
    ),
  ];
}

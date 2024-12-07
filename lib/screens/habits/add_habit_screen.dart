import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rise/data/command/habit/habits_command.dart';
import 'package:rise/theme.dart';

import '../../data/data/habit/habit.dart';
import '../onboarding/components/components.dart';
import 'dart:math';

class AddHabitScreen extends StatefulWidget {
  const AddHabitScreen({super.key});

  @override
  State<AddHabitScreen> createState() => _AddHabitScreenState();
}

class _AddHabitScreenState extends State<AddHabitScreen> {
  final _habitNameController = TextEditingController();

  String getRandomImg() {
    const images = [
      // "assets/yoga_women1.png",
      "assets/yoga_women2.png",
      "assets/yoga_women3.png",
    ];
    final random = Random();
    return images[random.nextInt(images.length)];
  }

  @override
  Widget build(BuildContext context) {
    final height = context.height;
    final width = context.width;
    final textTheme = context.textTheme;
    final colorScheme = context.colorScheme;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          // leading: IconButton(
          //   icon: const Icon(Icons.arrow_back_ios),
          //   onPressed: () {
          //     Navigator.pop(context);
          //   },
          // ),
          ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            /// Title
            Text(
              'Put a name for \nyour Habit',
              style: textTheme.titleMedium
                  ?.copyWith(fontSize: 20, fontFamily: "Merriweather"),
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 16),

            /// Text Field
            TextField(
              controller: _habitNameController,
              maxLength: 20,
              keyboardType: TextInputType.text,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                hintText: 'eg: Gym',
                hintStyle: TextStyle(color: colorScheme.outline),
                filled: true,
                fillColor: colorScheme.onInverseSurface,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
              onSubmitted: (_) => _goToSelectHabitCategory(),
            ),
            const SizedBox(height: 32),

            /// Next Button
            GetStartedButton(onTap: _goToSelectHabitCategory),
            SizedBox(height: height * 0.1),

            /// Bottom Section: Illustration
            Image.asset(
              getRandomImg(),
              height: 200,
            ),
            SizedBox(height: height * 0.1),
          ],
        ),
      ),
    );
  }

  void _goToSelectHabitCategory() {
    final habitName = _habitNameController.text.trim();

    if (habitName.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a habit name'),
        ),
      );
      return;
    }

    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => SelectHabitCategory(habitName: habitName),
      ),
    );
  }
}

/// Select Habit Category Screen
class SelectHabitCategory extends StatelessWidget {
  final String habitName;

  const SelectHabitCategory({
    super.key,
    required this.habitName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Category'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// Title
          Text(
            'Select a category for\nyour habit',
            textAlign: TextAlign.center,
            style: context.textTheme.titleMedium
                ?.copyWith(fontSize: 20, fontFamily: "Merriweather"),
          ),
          const SizedBox(height: 16),

          /// Categories
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(width: context.width * 0.2),

                // Habit List
                for (final category in HabitCategory.values)
                  HabitCategoryCard(
                    category: category,
                    onTap: () {
                      // add habit in hive
                      HabitsCommand().addHabit(
                        name: habitName,
                        category: category,
                      );

                      // pop all screens
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    },
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Habit Category Card
class HabitCategoryCard extends StatelessWidget {
  final HabitCategory category;
  final void Function() onTap;

  const HabitCategoryCard({
    super.key,
    required this.category,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    final cardColor = category.color.harmonizeWith(colorScheme.surface);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 80,
        width: 100,
        margin: const EdgeInsets.only(left: 4, right: 4),
        decoration: BoxDecoration(
          color: cardColor.withAlpha(80),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              category.icon,
              size: 30,
              color: cardColor,
            ),
            const SizedBox(height: 8),
            Text(
              category.name,
              style: TextStyle(
                color: cardColor,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

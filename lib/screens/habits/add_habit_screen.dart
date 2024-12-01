import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rise/theme.dart';

import '../onboarding/components/components.dart';

class AddHabitScreen extends StatefulWidget {
  const AddHabitScreen({super.key});

  @override
  State<AddHabitScreen> createState() => _AddHabitScreenState();
}

class _AddHabitScreenState extends State<AddHabitScreen> {
  final _habitNameController = TextEditingController();

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
        title: const Text('Add Habit'),
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
              style: textTheme.titleMedium?.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
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
                hintText: 'eg: Go to Gym',
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
              'assets/yoga_person.png',
              height: 150,
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
            style: context.textTheme.titleMedium?.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 16),

          /// Categories
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(width: context.width * 0.2),
                for (int i = 0; i < 10; i++)
                  const HabitCategoryCard(
                    title: 'Health',
                    icon: Icons.directions_run,
                    color: Colors.orange,
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
  final String title;
  final IconData icon;
  final Color color;

  const HabitCategoryCard({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    final cardColor = color.harmonizeWith(colorScheme.surface);

    return Container(
      height: 100,
      width: 100,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: cardColor.withAlpha(80),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 30,
            color: cardColor,
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              color: cardColor,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:rise/data/data/habit/habit.dart';

import '../../data/user/user.dart';
import 'hive_service.dart';

extension AppHiveService on HiveService {
  Future<void> saveUser(UserData user) async {
    await box<UserData>().put('currentUser', user);
  }

  UserData? get getSavedUserData => box<UserData>().get('currentUser');

  // Clearing the box on log out so not needed
  // Future<void> logOut() async {
  //   await box<UserData>().delete('currentUser');
  // }

  /// get is show onboarding
  bool getIsShowOnboarding() {
    final showOnboarding = box<bool>().get('isShowOnboarding') ?? true;

    if (showOnboarding) box<bool>().put('isShowOnboarding', false);

    return showOnboarding;
  }
}

/// Habit Service
extension HabitService on HiveService {
  // Add new habit
  Future<void> addHabit(HabitData habit) async {
    await habitBox.put(habit.id, habit);
  }

  // Delete habit
  Future<void> deleteHabit(String id) async {
    await habitBox.delete(id);

    // Delete all the habit records data
    final records =
        habitRecordBox.values.where((record) => record.habitId == id);
    habitRecordBox.deleteAll(records);
  }

  // Add habit record
  Future<void> addHabitRecord(HabitRecordData habitRecord) async {
    await habitRecordBox.put(habitRecord.id, habitRecord);
  }

  // Delete habit record
  Future<void> deleteHabitRecord(String recordId) async {
    await habitRecordBox.delete(recordId);
  }
}

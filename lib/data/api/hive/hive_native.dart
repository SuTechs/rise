import 'package:hive_flutter/adapters.dart';
import 'package:rise/data/data/habit/habit.dart';

import '../../data/user/user.dart';
import 'hive_service.dart';

class NativeHiveService extends HiveService {
  @override
  Future<void> init() async {
    /// init hive
    await Hive.initFlutter();

    /// register adapters
    await _registerAdapters();

    /// open box
    await _openBox();
  }

  /// register adapters for all custom data types and hive objets
  static Future<void> _registerAdapters() async {
    Hive.registerAdapter(UserDataAdapter());
    Hive.registerAdapter(HabitDataAdapter());
    Hive.registerAdapter(HabitRecordDataAdapter());
    Hive.registerAdapter(HabitCategoryAdapter());

    // add more adapters here
  }

  /// open box for all custom data types and hive objets
  static Future<void> _openBox() async {
    await Hive.openBox<String>('String');
    await Hive.openBox<bool>("bool");

    await Hive.openBox<UserData>('UserData');
    await Hive.openBox<HabitData>('HabitData');
    await Hive.openBox<HabitRecordData>('HabitRecordData');

    // add more boxes here
  }

  /// get opened box
  @override
  Box<T> box<T>() {
    return Hive.box<T>(T.toString());
  }

  // reset hive
  @override
  void reset() {
    // clear user data
    box<UserData>().clear();
    box<HabitData>().clear();
    box<HabitRecordData>().clear();

    box<bool>().clear();
    stringBox.clear();
  }

  @override
  Box<String> get stringBox => box<String>();

  @override
  Box<bool> get boolBox => box<bool>();

  // Habit Box
  @override
  Box<HabitData> get habitBox => box<HabitData>();

  // Habit Record Box
  @override
  Box<HabitRecordData> get habitRecordBox => box<HabitRecordData>();
}

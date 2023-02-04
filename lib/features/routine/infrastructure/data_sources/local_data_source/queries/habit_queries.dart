import 'package:habit_master/features/routine/infrastructure/models/habit_model.dart';
import 'package:sqflite/sqflite.dart';

class HabitQueries {
  Future<List<Habit>> getHabitById(Database database) async {
    final rawHabits = await database.query("habit");
    final List<Habit> result = [];

    for (var i = 0; i < rawHabits.length; i++) {
      final rawHabit = rawHabits[i];
      result.add(Habit.fromJson(rawHabit));
    }
    return result;
  }
}

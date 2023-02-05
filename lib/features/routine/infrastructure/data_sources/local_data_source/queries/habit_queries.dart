import 'dart:async';

import 'package:habit_master/core/db/local_db.dart';
import 'package:habit_master/core/db/db_constants.dart';
import 'package:habit_master/features/routine/infrastructure/data_sources/local_data_source/mutation/habit.dart';
import 'package:habit_master/features/routine/infrastructure/models/habit_model.dart';
import 'package:habit_master/shared/static/dates.dart';

class HabitQueries {
  HabitQueries(String habitID) {
    getHabitsData(habitID).then((rawTasksData) async {
      final List<Habit> habits = [];
      for (var index = 0; index < rawTasksData.length; index++) {
        final rawHabit = rawTasksData[index];
        final habit = Habit.fromJson(rawHabit);
        await _updateHabitExpirationDate(habit);
        habits.add(habit);
        _streamController.sink.add(habits);
      }
    });
  }

  final _streamController = StreamController<List<Habit>>();
  Stream<List<Habit>> get stream => _streamController.stream;

  Future<List<Map<String, Object?>>> getHabitsData(String routineID) async {
    final List<Map<String, Object?>> data =
        await LocalDatabase.instance.database.then((value) {
      final String query = LocalDatabaseConstantProvider.getHabits(routineID);
      return value.rawQuery(query);
    });
    return data;
  }

  Future<void> _updateHabitExpirationDate(Habit habit) async {
    final diff =
        DateTime.now().compareTo(DateTime.parse(habit.expirationDate!));
    if ((diff == 1) || (diff == 0)) {
      final newDate = expirationDate;
      await HabitMutations().updateHabitExpirationDate(habit.id!, newDate);
      if (habit.isDone! == true) {
        await HabitMutations().toggleHabit(habit, false);
      }
    } else {
      return;
    }
  }
}

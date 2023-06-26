import 'dart:async';

import 'package:habit_master/core/db/local_db.dart';
import 'package:habit_master/core/db/db_constants.dart';
import 'package:habit_master/dep_injection.dart';
import 'package:habit_master/features/auth/api/identity_api.dart';
import 'package:habit_master/features/routine/domain/interfaces/habit_queries_interface.dart';
import 'package:habit_master/features/routine/infrastructure/data_sources/local_data_source/mutation/habit.dart';
import 'package:habit_master/features/routine/infrastructure/models/habit_model.dart';
import 'package:habit_master/features/routine/infrastructure/repository/habit_remote_repository.dart';
import 'package:habit_master/shared/static/dates.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class HabitQueries implements HabitQueriesInterface {
  HabitQueries(String habitID, String habitType) {
    final List<Habit> habits = [];

    if (habitType == "local") {
      getHabitsData(habitID).then((rawHabitsData) async {
        for (var index = 0; index < rawHabitsData.length; index++) {
          final rawHabit = rawHabitsData[index];
          final habit = Habit.fromJson(rawHabit);
          final hasExpired =
              DateTime.now().isAfter(DateTime.parse(habit.expirationDate!));

          if (hasExpired == true) {
            await HabitMutations()
                .updateHabitExpirationDate(habit.id!, expirationDate);
            HabitMutations().toggleHabit(habit, false);
          }

          habits.add(habit);
          _streamController.sink.add(habits);
        }
      });
    }
    getRemoteHabitType(habitID).then((rawHabits) async {
      for (var index = 0; index < rawHabits.length; index++) {
        final rawHabit = rawHabits[index];
        final habit = Habit.fromJson(rawHabit);
        final hasExpired =
            DateTime.now().isAfter(DateTime.parse(habit.expirationDate!));

        if (hasExpired == true) {
          await HabitMutations()
              .updateHabitExpirationDate(habit.id!, expirationDate);
          HabitMutations().toggleHabit(habit, false);
        }

        habits.add(habit);
        _streamController.sink.add(habits);
      }
    });
  }

  final _streamController = StreamController<List<Habit>>();
  Stream<List<Habit>> get stream => _streamController.stream;
  @override
  Future<List<Map<String, Object?>>> getHabitsData(String routineID) async {
    final List<Map<String, Object?>> data =
        await LocalDatabase.instance.database.then((value) {
      final String query = LocalDatabaseConstantProvider.getHabits(routineID);
      return value.rawQuery(query);
    });
    return data;
  }

  Future<List<Map<String, Object?>>> getRemoteHabitType(
      String routineID) async {
    final database = await LocalDatabase.instance.database;

    final query =
        "SELECT * FROM habit WHERE routine_id = '$routineID' AND habit_type = 'remote'";
    final rawHabits = await database.rawQuery(query);
    return rawHabits;
  }

  @override
  Future<List<Map<String, Object?>>> countNumberOfDoneHabits(
      String routineID, String doneOn) async {
    try {
      final database = await LocalDatabase.instance.database;
      final query =
          "SELECT COUNT(id) FROM habit WHERE routine_id = '$routineID' AND done_on = '$doneOn' AND is_done = ${true}";
      final result = await database.rawQuery(query);

      return result;
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<List<Map<String, Object?>>> getHabitById(String habitID) async {
    try {
      final database = await LocalDatabase.instance.database;
      final query = LocalDatabaseConstantProvider.getHabitById(habitID);
      final habit = await database.rawQuery(query);
      return habit;
    } catch (error) {
      rethrow;
    }
  }
}

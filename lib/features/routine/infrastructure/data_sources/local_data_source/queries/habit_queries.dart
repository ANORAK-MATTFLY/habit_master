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

class HabitQueries implements HabitQueriesInterface {
  HabitQueries(String habitID) {
    getHabitsData(habitID).then((rawHabitsData) async {
      final List<Habit> habits = [];
      for (var index = 0; index < rawHabitsData.length; index++) {
        final rawHabit = rawHabitsData[index];
        final habit = Habit.fromJson(rawHabit);
        final hasExpired =
            DateTime.now().isAfter(DateTime.parse(habit.expirationDate!));

        final currentUserID =
            serviceLocator<IdentityApi>().getAuthenticatedUser()!.uid;
        if (habit.routineID == currentUserID) {
          final habitExist = await serviceLocator<HabitRemoteRepository>()
              .habitRemoteQueries
              .checkIfHabitExist(habit.id!);
          if (habitExist == false) {
            await serviceLocator<HabitRemoteRepository>()
                .habitRemoteMutations
                .uploadPersonalHabit(habit);
          }
        }

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

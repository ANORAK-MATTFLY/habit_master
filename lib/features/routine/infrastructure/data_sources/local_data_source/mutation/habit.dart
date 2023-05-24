import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:habit_master/core/db/local_db.dart';
import 'package:habit_master/core/db/db_constants.dart';

import 'package:habit_master/core/errors/interface/error_model.dart';
import 'package:habit_master/dep_injection.dart';
import 'package:habit_master/features/leader_board/domain/logic/leader_board_logic.dart';
import 'package:habit_master/features/routine/domain/interfaces/habit_mutation_interface.dart';
import 'package:habit_master/features/routine/infrastructure/models/habit_history.dart';
import 'package:habit_master/features/routine/infrastructure/models/habit_model.dart';
import 'package:habit_master/features/routine/infrastructure/repository/habit_history_repository.dart';

import 'package:sqflite/sqflite.dart';
import 'package:uuid/uuid.dart';

class HabitMutations implements HabitMutationsInterface {
  final uuid = const Uuid();

  @override
  Future<Either<Failure, bool>> createHabit(Habit habit) async {
    try {
      final database = await LocalDatabase.instance.database;
      final createTaskQuery = LocalDatabaseConstantProvider.createHabit(habit);
      await database.rawInsert(createTaskQuery);
      return const Right(true);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<Either<Failure, bool>> toggleHabit(Habit habit, bool isDone) async {
    try {
      final database = await LocalDatabase.instance.database;
      final updateHabit =
          LocalDatabaseConstantProvider.updateHabitDoneAttribute(
        isDone,
        habit.id!,
      );

      await database.rawUpdate(updateHabit);
      return const Right(true);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<Either<Failure, bool>> updateHabitDoneDate(
      Habit habit, bool isAlreadySet) async {
    final String habitID = habit.id!;
    final String doneDate = Timestamp.now().toDate().toString().split(" ")[0];
    final database = await LocalDatabase.instance.database;
    final todaysHabitHistory =
        await HabitHistoryRepository().getTodaysHabitHistoryRecord(habitID);

    if (isAlreadySet == true) {
      final query =
          "UPDATE habit SET done_on = '$doneDate' WHERE id = '$habitID'";

      await database.rawUpdate(query);

      const uuid = Uuid();
      if (todaysHabitHistory.habitID == null) {
        final id = "${uuid.v1()}-${DateTime.now().microsecond.toString()}-";
        final HabitHistory habitHistory =
            HabitHistory(doneOn: doneDate, habitID: habitID, id: id);
        await HabitHistoryRepository().createHabitHistoryRecord(habitHistory);

        await serviceLocator<LeaderBoardLogic>()
            .leaderRepository
            .executeUpdateScore(habit.routineID!);
        return const Right(true);
      } else {
        await LeaderBoardLogic().subtractLeaderScore(habit.routineID!);
        await HabitHistoryRepository().deleteHabitHistoryRecord(habitID);
        return const Right(true);
      }
    }
    if (isAlreadySet == false) {
      final query = "UPDATE habit SET done_on = '' WHERE id = '$habitID'";

      await database.rawUpdate(query);

      return const Right(true);
    }
    return const Right(true);
  }

  @override
  Future<Either<Failure, bool>> updateHabitExpirationDate(
      String habitID, String expirationDate) async {
    try {
      final Database database = await LocalDatabase.instance.database;
      final String query = LocalDatabaseConstantProvider.updateExpirationDate(
          expirationDate, habitID);
      await database.rawUpdate(query);
      return const Right(true);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<Either<Failure, bool>> createHabits(List<Habit> habits) async {
    try {
      final database = await LocalDatabase.instance.database;

      for (int index = 0; index < habits.length; index++) {
        final Habit habit = habits[index];
        final habitData = await database.rawQuery(
            "SELECT * FROM habit WHERE routine_id = '${habit.routineID}' AND habit_name = '${habit.habitName}'");
        // ignore: unnecessary_null_comparison
        if (habitData.isEmpty) {
          final insertHabit =
              await LocalDatabaseConstantProvider.createHabit(habit);
          await database.rawInsert(insertHabit);
        }
      }
      return const Right(true);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<bool> deleteHabit(String habitID) async {
    try {
      final database = await LocalDatabase.instance.database;
      database.rawQuery("DELETE FROM habit WHERE id = '$habitID'");
      return true;
    } catch (error) {
      rethrow;
    }
  }
}

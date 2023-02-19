import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:habit_master/core/db/local_db.dart';
import 'package:habit_master/core/db/db_constants.dart';
import 'package:habit_master/core/errors/exception_handlers.dart';
import 'package:habit_master/core/errors/interface/error_model.dart';
import 'package:habit_master/features/routine/domain/interfaces/habit_mutation_interface.dart';
import 'package:habit_master/features/routine/infrastructure/models/habit_history.dart';
import 'package:habit_master/features/routine/infrastructure/models/habit_model.dart';
import 'package:habit_master/features/routine/infrastructure/repository/habit_history_repository.dart';

import 'package:sqflite/sqflite.dart';
import 'package:uuid/uuid.dart';

class HabitMutations implements HabitMutationsInterface {
  final uuid = const Uuid();
  final ExceptionHandlers exceptionHandlers = ExceptionHandlers();

  @override
  Future<Either<ErrorInfo, bool>> createHabit(Habit task) async {
    try {
      final database = await LocalDatabase.instance.database;
      final createTaskQuery = LocalDatabaseConstantProvider.createHabit(task);
      await database.rawInsert(createTaskQuery);
      return const Right(true);
    } on DatabaseException catch (error) {
      return exceptionHandlers.handleLocalDatabaseError(error, "createHabit");
    }
  }

  @override
  Future<Either<ErrorInfo, bool>> toggleHabit(Habit habit, bool isDone) async {
    try {
      final database = await LocalDatabase.instance.database;
      final updateHabit =
          LocalDatabaseConstantProvider.updateHabitDoneAttribute(
              isDone, habit.id!);

      await database.rawUpdate(updateHabit);
      return const Right(true);
    } on DatabaseException catch (error) {
      return exceptionHandlers.handleLocalDatabaseError(error, "toggleHabit");
    }
  }

  @override
  Future<Either<ErrorInfo, bool>> updateHabitDoneDate(
      String habitID, bool isAlreadySet) async {
    try {
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
          return const Right(true);
        } else {
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
    } on DatabaseException catch (error) {
      return exceptionHandlers.handleLocalDatabaseError(
          error, "updateHabitDoneDate");
    }
  }

  @override
  Future<Either<ErrorInfo, bool>> updateHabitExpirationDate(
      String habitID, String expirationDate) async {
    try {
      final Database database = await LocalDatabase.instance.database;
      final String query = LocalDatabaseConstantProvider.updateExpirationDate(
          expirationDate, habitID);
      await database.rawUpdate(query);
      return const Right(true);
    } on DatabaseException catch (error) {
      return exceptionHandlers.handleLocalDatabaseError(
          error, "updateHabitExpirationDate");
    }
  }

  @override
  Future<Either<ErrorInfo, bool>> createHabits(List<Habit> habits) async {
    try {
      final database = await LocalDatabase.instance.database;
      for (int index = 0; index < habits.length; index++) {
        final Habit habit = habits[index];
        final insertHabit = LocalDatabaseConstantProvider.createHabit(habit);
        await database.rawInsert(insertHabit);
      }
      return const Right(true);
    } on DatabaseException catch (error) {
      return exceptionHandlers.handleLocalDatabaseError(error, "createHabits");
    }
  }
}

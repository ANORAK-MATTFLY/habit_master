import 'package:fpdart/fpdart.dart';
import 'package:habit_master/core/db/db_constants.dart';
import 'package:habit_master/core/db/local_db.dart';
import 'package:habit_master/core/errors/exception_handlers.dart';
import 'package:habit_master/core/errors/interface/error_model.dart';
import 'package:habit_master/features/routine/domain/interfaces/habit_history_mutation_interface.dart';
import 'package:habit_master/features/routine/infrastructure/models/habit_history.dart';
import 'package:sqflite/sqflite.dart';

class HabitHistoryMutations implements HabitHistoryMutationsInterface {
  final ExceptionHandlers exceptionHandlers = ExceptionHandlers();

  @override
  Future<Either<Failure, bool>> deleteHabitHistoryRecord(String habitID) async {
    try {
      final database = await LocalDatabase.instance.database;
      final query = LocalDatabaseConstantProvider.deleteHabitHistory(habitID);
      await database.rawDelete(query);
      return const Right(true);
    } on DatabaseException catch (error) {
      return exceptionHandlers.handleLocalDatabaseError(
          error, "deleteHabitHistoryRecord");
    }
  }

  @override
  Future<Either<Failure, bool>> createHabitHistoryRecord(
      HabitHistory habitHistory) async {
    try {
      final database = await LocalDatabase.instance.database;
      final query =
          LocalDatabaseConstantProvider.createHabitHistory(habitHistory);
      await database.rawInsert(query);
      return const Right(true);
    } on DatabaseException catch (error) {
      return exceptionHandlers.handleLocalDatabaseError(
          error, "createHabitHistory");
    }
  }
}

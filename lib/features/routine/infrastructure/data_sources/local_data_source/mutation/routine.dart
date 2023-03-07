import 'package:fpdart/fpdart.dart';
import 'package:habit_master/core/db/local_db.dart';
import 'package:habit_master/core/db/db_constants.dart';
import 'package:habit_master/core/errors/exception_handlers.dart';
import 'package:habit_master/core/errors/interface/error_model.dart';
import 'package:habit_master/features/routine/domain/interfaces/routine_mutation_interface.dart';
import 'package:habit_master/features/routine/infrastructure/models/author_model.dart';
import 'package:habit_master/features/routine/infrastructure/models/routine_model.dart';
import 'package:sqflite/sqflite.dart';

class RoutinesMutations implements RoutinesMutationsInterface {
  final ExceptionHandlers exceptionHandlers = ExceptionHandlers();

  @override
  Future<Either<Failure, bool>> createRoutine(
      Author author, int successRate) async {
    try {
      final database = await LocalDatabase.instance.database;

      final Routine routine = Routine(
        authorID: author.id!,
        authorName: author.authorName!,
        authorProfilePicture: author.authorProfilePicture!,
        description: "",
        subscribers: 0,
        isPremium: 1,
        subTitle: "",
        successRate: successRate,
        progress: 0,
      );

      final command = LocalDatabaseConstantProvider.createRoutine(routine);
      await database.rawInsert(command);
      return const Right(true);
    } on DatabaseException catch (error) {
      return exceptionHandlers.handleLocalDatabaseError(error, "createRoutine");
    }
  }
}

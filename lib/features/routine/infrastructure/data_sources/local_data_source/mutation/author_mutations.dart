import 'package:fpdart/fpdart.dart';
import 'package:habit_master/core/db/local_db.dart';
import 'package:habit_master/core/db/db_constants.dart';
import 'package:habit_master/core/errors/exception_handlers.dart';
import 'package:habit_master/core/errors/interface/error_model.dart';
import 'package:habit_master/dep_injection.dart';
import 'package:habit_master/features/auth/api/identity_api.dart';
import 'package:habit_master/features/routine/domain/interfaces/author_mutation_interface.dart';
import 'package:sqflite/sqflite.dart';

import '../../../models/author_model.dart';

class AuthorMutations implements AuthorMutationsInterface {
  final ExceptionHandlers _exceptionHandlers = ExceptionHandlers();
  @override
  Future<Either<Failure, bool>> createAuthor(Author author) async {
    try {
      final database = await LocalDatabase.instance.database;
      final insertAuthor = LocalDatabaseConstantProvider.createAuthor(author);
      await database.rawInsert(insertAuthor);
      return const Right(true);
    } on DatabaseException catch (error) {
      return _exceptionHandlers.handleLocalDatabaseError(
          error, "createAuthor method");
    }
  }

  @override
  Future<bool> subscribeToRoutine(String routineId) async {
    final String currentUserID =
        serviceLocator<IdentityApi>().getAuthenticatedUser()!.uid;

    final database = await LocalDatabase.instance.database;
    final query =
        "UPDATE author SET subscribed_to = '$routineId' WHERE id = '$currentUserID'";
    await database.rawUpdate(query);
    return true;
  }
}

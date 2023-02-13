import 'package:habit_master/core/db/local_db.dart';
import 'package:habit_master/core/db/db_constants.dart';

import '../../../models/author_model.dart';

class AuthorMutations {
  Future<bool> createAuthor(Author author) async {
    final database = await LocalDatabase.instance.database;
    try {
      final insertAuthor = LocalDatabaseConstantProvider.createAuthor(author);
      await database.rawInsert(insertAuthor);
      return true;
    } catch (error) {
      return false;
    }
  }

  Future<bool> subscribeToRoutine(
      String routineId, String currentUserID) async {
    try {
      final database = await LocalDatabase.instance.database;
      final query =
          "UPDATE author SET subscribed_to = '$routineId' WHERE id = '$currentUserID'";
      await database.rawUpdate(query);
      return false;
    } catch (error) {
      rethrow;
    }
  }
}

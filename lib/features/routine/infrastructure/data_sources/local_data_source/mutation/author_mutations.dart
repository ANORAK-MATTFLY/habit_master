import 'package:habit_master/core/db/local_db.dart';
import 'package:habit_master/core/db/db_constants.dart';
import 'package:habit_master/features/routine/infrastructure/data_sources/local_data_source/mutation/routine.dart';

import '../../../models/author_model.dart';

class AuthorMutations {
  createAuthor(List<Author> authors) async {
    final database = await LocalDatabase.instance.database;
    try {
      for (int index = 0; index < authors.length; index++) {
        final Author author = authors[index];
        await RoutinesMutations().createRoutine(author, 0);
        final insertAuthor = LocalDatabaseConstantProvider.createAuthor(author);
        await database.rawInsert(insertAuthor);
      }
      return true;
    } catch (error) {
      return false;
    }
  }
}

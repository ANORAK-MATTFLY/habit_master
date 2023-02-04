import 'package:habit_master/features/routine/infrastructure/data_sources/local_data_source/db_constants.dart';
import 'package:sqflite/sqflite.dart';

import '../../../models/author_model.dart';

class AuthorMutations {
  Stream createAuthor(Database database, List<Author> authors) async* {
    try {
      for (int index = 0; index < authors.length; index++) {
        final Author author = authors[index];
        final insertAuthor = LocalDatabaseConstantProvider.createAuthor(author);
        await database.rawInsert(insertAuthor);
      }
    } catch (error) {
      rethrow;
    }
  }
}

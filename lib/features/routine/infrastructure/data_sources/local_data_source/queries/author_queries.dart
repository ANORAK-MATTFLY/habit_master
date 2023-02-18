import 'package:habit_master/core/db/local_db.dart';

import '../../../models/author_model.dart';

class AuthorQueries {
  Future<bool> checkIfAuthorExist(String authorID) async {
    final database = await LocalDatabase.instance.database;
    final maps = await database
        .rawQuery("SELECT * FROM author WHERE id= '$authorID' LIMIT 1");
    return maps.isNotEmpty;
  }

  Future<Author> getAuthorById(String authorID) async {
    try {
      final database = await LocalDatabase.instance.database;
      final query = "SELECT * FROM author WHERE id = '$authorID' LIMIT 1";
      final rawData = await database.rawQuery(query);
      final Author author = Author.fromJson(rawData[0]);
      return author;
    } catch (error) {
      rethrow;
    }
  }
}

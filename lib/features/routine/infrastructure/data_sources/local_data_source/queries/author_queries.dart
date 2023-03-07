import 'package:habit_master/core/db/db_constants.dart';
import 'package:habit_master/core/db/local_db.dart';
import 'package:habit_master/features/routine/domain/interfaces/author_queries_interface.dart';

class AuthorQueries implements AuthorQueriesInterface {
  @override
  Future<bool> checkIfAuthorExist(String authorID) async {
    final database = await LocalDatabase.instance.database;
    final maps = await database
        .rawQuery("SELECT * FROM author WHERE id= '$authorID' LIMIT 1");
    return maps.isNotEmpty;
  }

  @override
  Future<List<Map<String, Object?>>> getAuthorById(String authorID) async {
    try {
      final database = await LocalDatabase.instance.database;
      final query = "SELECT * FROM author WHERE id = '$authorID' LIMIT 1";
      final rawData = await database.rawQuery(query);
      return rawData;
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<List<Map<String, Object?>>> getCachedAuthor(String userID) async {
    final database = await LocalDatabase.instance.database;
    final query = LocalDatabaseConstantProvider.getCurrentUserFromCache(userID);
    final rawUserData = await database.rawQuery(query);
    return rawUserData;
  }
}

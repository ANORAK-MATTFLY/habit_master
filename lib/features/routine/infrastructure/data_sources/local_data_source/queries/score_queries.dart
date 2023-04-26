import 'package:habit_master/core/db/db_constants.dart';
import 'package:habit_master/core/db/local_db.dart';

class ScoreQueries {
  Future<List<Map<String, Object?>>> getScore(
      String userID, String scoredOn) async {
    try {
      final database = await LocalDatabase.instance.database;
      final sqlQuery = LocalDatabaseConstantProvider.getScore(userID, scoredOn);
      final score = await database.rawQuery(sqlQuery);
      return score;
    } catch (error) {
      rethrow;
    }
  }
}

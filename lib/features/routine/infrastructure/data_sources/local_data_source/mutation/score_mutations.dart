import 'package:habit_master/core/db/db_constants.dart';
import 'package:habit_master/core/db/local_db.dart';
import 'package:habit_master/features/routine/infrastructure/models/score_model.dart';

class ScoreMutations {
  createScore(Score score) async {
    try {
      final database = await LocalDatabase.instance.database;
      final sqlQuery = LocalDatabaseConstantProvider.createScore(score);
      await database.rawInsert(sqlQuery);
    } catch (error) {
      rethrow;
    }
  }

  updateScore(String userID, int score, String scoredOn) async {
    try {
      final database = await LocalDatabase.instance.database;
      final sqlQuery =
          LocalDatabaseConstantProvider.updateScore(userID, score, scoredOn);
      await database.rawUpdate(sqlQuery);
    } catch (error) {
      rethrow;
    }
  }
}

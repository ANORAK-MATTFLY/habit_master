import 'package:habit_master/core/db/local_db.dart';
import 'package:habit_master/features/statistics/infrastructure/models/score.dart';

class ScoreCommands {
  Future<bool> setScore(Score score) async {
    try {
      final database = await LocalDatabase.instance.database;
      final query =
          "UPDATE score SET score = ${score.scoreValue!}, scored_on = ${score.scoredOn!} WHERE habit_id = '${score.habitID}'";
      await database.rawUpdate(query);
      return true;
    } catch (error) {
      rethrow;
    }
  }
}

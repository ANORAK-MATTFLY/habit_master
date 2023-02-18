import 'package:habit_master/core/db/local_db.dart';

class ScoreQueries {
  Future<List<Map<String, Object?>>> getSumOfScores(String routineID) async {
    try {
      final database = await LocalDatabase.instance.database;
      final query =
          "SELECT SUM(score_value) FROM score WHERE routine_id = '$routineID'";
      final totalScore = await database.rawQuery(query);
      return totalScore;
    } catch (error) {
      rethrow;
    }
  }
}

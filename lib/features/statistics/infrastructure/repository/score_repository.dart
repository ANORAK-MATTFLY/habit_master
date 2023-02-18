import 'package:habit_master/features/statistics/infrastructure/data/local_data_store/commands/score_commands.dart';
import 'package:habit_master/features/statistics/infrastructure/data/local_data_store/queries/score_queries.dart';
import 'package:habit_master/features/statistics/infrastructure/models/score.dart';

class ScoreRepository {
  Future<bool> setScore(Score score) {
    return ScoreCommands().setScore(score);
  }

  Future<List<Map<String, Object?>>> getSumOfScores(String routineID) {
    return ScoreQueries().getSumOfScores(routineID);
  }
}

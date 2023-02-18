import 'package:habit_master/features/statistics/domain/logic/days_of_week.dart';
import 'package:habit_master/features/statistics/infrastructure/models/score.dart';
import 'package:habit_master/features/statistics/infrastructure/repository/score_repository.dart';

class StatsApi {
  Future<bool> setScore(Score score) {
    return ScoreRepository().setScore(score);
  }

  Future<List<Map<String, Object?>>> getSumOfScores(String routineID) {
    return ScoreRepository().getSumOfScores(routineID);
  }

  List<String> getDaysOfTheWeek() {
    return DateTimeManipulation.getDaysOfTheWeek();
  }
}

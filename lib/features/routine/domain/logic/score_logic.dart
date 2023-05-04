import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:habit_master/core/db/local_db.dart';
import 'package:habit_master/dep_injection.dart';
import 'package:habit_master/features/routine/domain/logic/get_days_of_the_week.dart';
import 'package:habit_master/features/routine/infrastructure/models/habit_model.dart';
import 'package:habit_master/features/routine/infrastructure/models/score_model.dart';
import 'package:habit_master/features/routine/infrastructure/repository/score_repository.dart';

class ScoreLogic {
  static Future<int> getProgress(String routineID) async {
    final database = await LocalDatabase.instance.database;
    final totalHabits = await database
        .rawQuery("SELECT * FROM habit WHERE routine_id = '$routineID'");
    int progress = 0;
    for (var index = 0; index < totalHabits.length; index++) {
      final rawHabit = totalHabits[index];
      final habit = Habit.fromJson(rawHabit);
      if (habit.isDone! == true) {
        progress += 1;
      }
    }
    final int percent = (progress * 100) ~/ totalHabits.length;
    return percent;
  }

  static Future updateScore(String routineID) async {
    String todaysDate = Timestamp.now().toDate().toString().split(" ")[0];

    final scoreRepository = serviceLocator<ScoreRepository>();
    final score = await getProgress(routineID);
    await scoreRepository.scoreMutations
        .updateScore(routineID, score, todaysDate);
  }

  static Future getScore(String routineID, String date) async {
    try {
      final scoreRepository = serviceLocator<ScoreRepository>();
      final rawScoreData =
          await scoreRepository.scoreQueries.getScore(routineID, date);
      // ignore: unnecessary_null_comparison
      if (rawScoreData[0] == null) {
        return;
      }
      final score = Score.fromJson(rawScoreData[0]);
      return score;
    } catch (error) {
      rethrow;
    }
  }

  createScore(String routineID) async {
    final week = DateTimeManipulation.getDaysOfTheWeek();
    final scoreRepository = serviceLocator<ScoreRepository>();

    for (var index = 0; index < 7; index++) {
      final date = week[index];

      final rawScoreData =
          await scoreRepository.scoreQueries.getScore(routineID, date);
      if (rawScoreData.isEmpty == true) {
        final scoreData = Score(
          score: 0,
          scoredOn: date,
          userID: routineID,
        );
        scoreRepository.scoreMutations.createScore(scoreData);
      }
    }
  }
}

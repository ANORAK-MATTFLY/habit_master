import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:habit_master/dep_injection.dart';
import 'package:habit_master/features/routine/infrastructure/models/habit_model.dart';
import 'package:habit_master/features/statistics/api/stats_api.dart';
import 'package:habit_master/features/statistics/infrastructure/models/score.dart';

class ScoreLogic {
  Future setScore(Habit habit, int numberOfHabitsInRoutine) async {
    final date = Timestamp.now().toDate();
    final formattedDate = date.toString().split(' ')[0];

    final Score score = Score(
      habitID: habit.id,
      routineID: habit.routineID,
      scoreValue: 3,
      scoredOn: formattedDate,
    );
    final updateScore = serviceLocator<StatsApi>();
    await updateScore.setScore(score);
  }
}

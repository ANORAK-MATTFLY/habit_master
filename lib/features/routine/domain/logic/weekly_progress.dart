import 'package:habit_master/features/routine/domain/logic/get_days_of_the_week.dart';
import 'package:habit_master/features/routine/domain/logic/score_logic.dart';
import 'package:habit_master/features/routine/infrastructure/models/weekly_progress_chart_model.dart';

class StatsLogic {
  Future<List<ChartData>> getWeeklyProgress(
      String routineID, int totalHabits) async {
    final List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    final week = DateTimeManipulation.getDaysOfTheWeek();

    final List<ChartData> chartData = [];
    for (var index = 0; index < 7; index++) {
      final date = week[index];
      final score = await ScoreLogic.getScore(routineID, date);

      final day = days[index];
      chartData.add(ChartData(day, score.score!));
    }
    return chartData;
  }
}

import 'package:habit_master/dep_injection.dart';
import 'package:habit_master/features/routine/infrastructure/models/weekly_progress_chart_model.dart';
import 'package:habit_master/features/routine/infrastructure/repository/habit_repository.dart';
import 'package:habit_master/features/statistics/api/stats_api.dart';

class StatsLogic {
  Future<List<ChartData>> getWeeklyProgress(
      String routineID, int totalHabits) async {
    final List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    final stats = serviceLocator<StatsApi>();
    final week = stats.getDaysOfTheWeek();
    final query = serviceLocator<HabitRepository>();
    final List<ChartData> chartData = [];

    for (var index = 0; index < week.length; index++) {
      final date = week[index];
      final day = days[index];
      final result = await query.countNumberOfDoneHabits(routineID, date);
      final progress = (result[0].values.elementAt(0)!) as int;
      final percent = (progress * 100) ~/ totalHabits;
      chartData.add(ChartData(day, percent));
    }

    return chartData;
  }
}

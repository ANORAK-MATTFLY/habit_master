import 'package:habit_master/features/routine/infrastructure/models/habit_history.dart';

abstract class HabitHistoryInterface {
  Future<List<HabitHistory>> getHabitHistoryRecord(String habitHistoryID);

  Future<bool> createHabitHistoryRecord(HabitHistory habitHistory);
  Future<bool> deleteHabitHistoryRecord(String habitHistoryID);
  Future<HabitHistory> getTodaysHabitHistoryRecord(String habitHistoryID);
}

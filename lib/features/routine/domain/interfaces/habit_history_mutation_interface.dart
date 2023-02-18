import 'package:habit_master/features/routine/infrastructure/models/habit_history.dart';

abstract class HabitHistoryMutationsInterface {
  Future<bool> deleteHabitHistoryRecord(String habitID);
  Future<bool> createHabitHistoryRecord(HabitHistory habitHistory);
}

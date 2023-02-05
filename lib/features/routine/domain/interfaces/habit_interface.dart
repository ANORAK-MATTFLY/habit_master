import 'package:habit_master/features/routine/infrastructure/models/habit_model.dart';

abstract class HabitInterface {
  Future<bool> createHabit(Habit habit);
  Future<bool> createHabits(List<Habit> tasks);
  Future<bool> updateHabitExpirationDate(String habitID, String expirationDate);
  Future<bool> toggleHabit(Habit habit, bool isDone);
  Stream<List<Habit>> getHabits(String routineID);
}

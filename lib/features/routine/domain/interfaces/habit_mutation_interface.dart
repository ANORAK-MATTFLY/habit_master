import 'package:habit_master/features/routine/infrastructure/models/habit_model.dart';

abstract class HabitMutationsInterface {
  Future<bool> createHabit(Habit task);
  Future<bool> toggleHabit(Habit habit, bool isDone);
  Future<bool> updateHabitDoneDate(String habitID, bool isAlreadySet);
  Future<bool> updateHabitExpirationDate(String habitID, String expirationDate);
  Future<bool> createHabits(List<Habit> habits);
}

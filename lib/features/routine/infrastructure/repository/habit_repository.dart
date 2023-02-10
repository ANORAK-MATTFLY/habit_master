import 'package:habit_master/features/routine/domain/interfaces/habit_interface.dart';
import 'package:habit_master/features/routine/infrastructure/data_sources/local_data_source/mutation/habit.dart';
import 'package:habit_master/features/routine/infrastructure/data_sources/local_data_source/queries/habit_queries.dart';
import 'package:habit_master/features/routine/infrastructure/models/habit_model.dart';

class HabitRepository implements HabitInterface {
  final HabitMutations habitMutations = HabitMutations();

  @override
  Future<bool> createHabit(Habit habit) {
    return habitMutations.createHabit(habit);
  }

  @override
  Future<bool> createHabits(List<Habit> habits) {
    return habitMutations.createHabits(habits);
  }

  @override
  Future<bool> toggleHabit(Habit habit, bool isDone) {
    return habitMutations.toggleHabit(habit, isDone);
  }

  @override
  Future<bool> updateHabitExpirationDate(
      String habitID, String expirationDate) {
    return habitMutations.updateHabitExpirationDate(habitID, expirationDate);
  }

  @override
  Stream<List<Habit>> getHabits(String routineID) {
    return HabitQueries(routineID).stream;
  }
}

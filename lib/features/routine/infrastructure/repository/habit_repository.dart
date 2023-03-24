import 'package:fpdart/fpdart.dart';
import 'package:habit_master/core/errors/interface/error_model.dart';
import 'package:habit_master/features/routine/domain/interfaces/habit_interface.dart';
import 'package:habit_master/features/routine/infrastructure/data_sources/local_data_source/mutation/habit.dart';
import 'package:habit_master/features/routine/infrastructure/data_sources/local_data_source/queries/habit_queries.dart';
import 'package:habit_master/features/routine/infrastructure/models/habit_model.dart';

class HabitRepository implements HabitInterface {
  final HabitMutations habitMutations = HabitMutations();

  @override
  Future<Either<Failure, bool>> createHabit(Habit habit) {
    return habitMutations.createHabit(habit);
  }

  @override
  Future<Either<Failure, bool>> createHabits(List<Habit> habits) {
    return habitMutations.createHabits(habits);
  }

  @override
  Future<Either<Failure, bool>> toggleHabit(Habit habit, bool isDone) {
    return habitMutations.toggleHabit(habit, isDone);
  }

  @override
  Future<Either<Failure, bool>> updateHabitExpirationDate(
      String habitID, String expirationDate) {
    return habitMutations.updateHabitExpirationDate(habitID, expirationDate);
  }

  @override
  Stream<List<Habit>> getHabits(
    String routineID,
  ) {
    return HabitQueries(routineID).stream;
  }

  @override
  Future<Either<Failure, bool>> updateHabitDoneDate(
      Habit habit, bool doneDate) {
    return habitMutations.updateHabitDoneDate(habit, doneDate);
  }

  @override
  Future<List<Map<String, Object?>>> countNumberOfDoneHabits(
      String routineID, String doneOn) {
    return HabitQueries('').countNumberOfDoneHabits(routineID, doneOn);
  }

  @override
  Future<Habit> getHabitById(String habitID) async {
    final List<Habit> habits = [];
    final rawHabitData = await HabitQueries(habitID).getHabitById(habitID);
    final Habit habit = Habit.fromJson(rawHabitData[0]);
    habits.add(habit);
    return habits[0];
  }
}

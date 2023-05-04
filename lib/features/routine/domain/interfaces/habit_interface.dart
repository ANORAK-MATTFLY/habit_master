import 'package:fpdart/fpdart.dart';
import 'package:habit_master/core/errors/interface/error_model.dart';
import 'package:habit_master/features/routine/infrastructure/models/habit_model.dart';

abstract class HabitInterface {
  Future<Either<Failure, bool>> createHabit(Habit habit);
  Future<Either<Failure, bool>> createHabits(List<Habit> tasks);
  Future<Either<Failure, bool>> updateHabitExpirationDate(
      String habitID, String expirationDate);
  Future<Either<Failure, bool>> toggleHabit(Habit habit, bool isDone);
  Stream<List<Habit>> getHabits(String routineID);
  Future<Either<Failure, bool>> updateHabitDoneDate(
      Habit habit, bool isAlreadySet);
  Future<List<Map<String, Object?>>> countNumberOfDoneHabits(
      String routineID, String doneOn);
  Future<Habit> getHabitById(String habitID);
}

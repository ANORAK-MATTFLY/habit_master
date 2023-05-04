import 'package:fpdart/fpdart.dart';
import 'package:habit_master/core/errors/interface/error_model.dart';
import 'package:habit_master/features/routine/infrastructure/models/habit_model.dart';

abstract class HabitMutationsInterface {
  Future<Either<Failure, bool>> createHabit(Habit task);
  Future<Either<Failure, bool>> toggleHabit(Habit habit, bool isDone);
  Future<Either<Failure, bool>> updateHabitDoneDate(
      Habit habit, bool isAlreadySet);
  Future<Either<Failure, bool>> updateHabitExpirationDate(
      String habitID, String expirationDate);
  Future<Either<Failure, bool>> createHabits(List<Habit> habits);
  Future<bool> deleteHabit(String habitID);
}

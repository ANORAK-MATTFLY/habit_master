import 'package:fpdart/fpdart.dart';
import 'package:habit_master/core/errors/interface/error_model.dart';
import 'package:habit_master/features/routine/infrastructure/models/habit_model.dart';

abstract class HabitMutationsInterface {
  Future<Either<ErrorInfo, bool>> createHabit(Habit task);
  Future<Either<ErrorInfo, bool>> toggleHabit(Habit habit, bool isDone);
  Future<Either<ErrorInfo, bool>> updateHabitDoneDate(
      String habitID, bool isAlreadySet);
  Future<Either<ErrorInfo, bool>> updateHabitExpirationDate(
      String habitID, String expirationDate);
  Future<Either<ErrorInfo, bool>> createHabits(List<Habit> habits);
}

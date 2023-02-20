import 'package:fpdart/fpdart.dart';
import 'package:habit_master/core/errors/interface/error_model.dart';
import 'package:habit_master/features/routine/infrastructure/models/habit_model.dart';

abstract class HabitInterface {
  Future<Either<ErrorInfo, bool>> createHabit(Habit habit);
  Future<Either<ErrorInfo, bool>> createHabits(List<Habit> tasks);
  Future<Either<ErrorInfo, bool>> updateHabitExpirationDate(
      String habitID, String expirationDate);
  Future<Either<ErrorInfo, bool>> toggleHabit(Habit habit, bool isDone);
  Stream<List<Habit>> getHabits(String routineID);
  Future<Either<ErrorInfo, bool>> updateHabitDoneDate(
      String habitID, bool isAlreadySet);
  Future<List<Map<String, Object?>>> countNumberOfDoneHabits(
      String routineID, String doneOn);
  Future<Habit> getHabitById(String habitID);
}

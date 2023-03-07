import 'package:fpdart/fpdart.dart';
import 'package:habit_master/core/errors/interface/error_model.dart';
import 'package:habit_master/features/routine/infrastructure/models/habit_history.dart';

abstract class HabitHistoryMutationsInterface {
  Future<Either<Failure, bool>> deleteHabitHistoryRecord(String habitID);
  Future<Either<Failure, bool>> createHabitHistoryRecord(
      HabitHistory habitHistory);
}

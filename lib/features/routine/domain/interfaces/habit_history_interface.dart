import 'package:fpdart/fpdart.dart';
import 'package:habit_master/core/errors/interface/error_model.dart';
import 'package:habit_master/features/routine/infrastructure/models/habit_history.dart';

abstract class HabitHistoryInterface {
  Future<List<HabitHistory>> getHabitHistoryRecord(String habitHistoryID);

  Future<Either<ErrorInfo, bool>> createHabitHistoryRecord(
      HabitHistory habitHistory);
  Future<Either<ErrorInfo, bool>> deleteHabitHistoryRecord(
      String habitHistoryID);
  Future<HabitHistory> getTodaysHabitHistoryRecord(String habitHistoryID);
}

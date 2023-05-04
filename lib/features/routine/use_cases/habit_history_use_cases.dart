import 'package:fpdart/fpdart.dart';
import 'package:habit_master/core/errors/interface/error_model.dart';
import 'package:habit_master/features/routine/infrastructure/models/habit_history.dart';
import 'package:habit_master/features/routine/infrastructure/repository/habit_history_repository.dart';
import 'package:habit_master/shared/static/dates.dart';
import 'package:uuid/uuid.dart';

class HabitHistoryUseCase {
  Future<Either<Failure?, bool>> executeCreateHabitHistoryRecord(
      String habitID, bool canExecute) async {
    if (canExecute == false) {
      return const Right(false);
    }
    const uuid = Uuid();
    final todaysHabitHistory =
        await HabitHistoryRepository().getTodaysHabitHistoryRecord(habitID);
    if (todaysHabitHistory.habitID == null) {
      final id = "${uuid.v1()}-${DateTime.now().microsecond.toString()}-";
      final HabitHistory habitHistory =
          HabitHistory(doneOn: doneDate, habitID: habitID, id: id);
      final createResult =
          await HabitHistoryRepository().createHabitHistoryRecord(habitHistory);
      if (createResult.isLeft()) {
        return Left(createResult.getLeft().getOrElse(() {
          return Failure(
            errorMessage: "Something went wrong",
            errorSource: "createHabitHistoryRecord",
            errorType: "db error",
          );
        }));
      }
      return Right(createResult.getRight().getOrElse(() => false));
    }
    final deleteResult =
        await HabitHistoryRepository().deleteHabitHistoryRecord(habitID);
    if (deleteResult.isLeft()) {
      return Left(deleteResult.getLeft().getOrElse(() {
        return Failure(
          errorMessage: "Something went wrong",
          errorSource: "createHabitHistoryRecord",
          errorType: "db error",
        );
      }));
    }
    return Right(deleteResult.getRight().getOrElse(() => false));
  }
}

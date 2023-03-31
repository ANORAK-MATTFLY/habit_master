import 'package:fpdart/fpdart.dart';
import 'package:habit_master/core/errors/interface/error_model.dart';
import 'package:habit_master/features/routine/infrastructure/models/author_model.dart';
import 'package:habit_master/features/routine/infrastructure/models/routine_model.dart';

abstract class RoutineInterface {
  Future<Either<Failure, bool>> createRoutine(
      Author author, int successRate, String type);
  Stream<List<Routine>> getRoutines(String routineType);
  Future<Routine> getOneRoutine(String authorID);
}

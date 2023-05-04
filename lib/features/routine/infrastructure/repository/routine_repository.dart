import 'package:fpdart/fpdart.dart';
import 'package:habit_master/core/errors/interface/error_model.dart';
import 'package:habit_master/features/routine/domain/interfaces/routine_interface.dart';
import 'package:habit_master/features/routine/infrastructure/data_sources/local_data_source/mutation/routine.dart';
import 'package:habit_master/features/routine/infrastructure/data_sources/local_data_source/queries/routine_queries.dart';
import 'package:habit_master/features/routine/infrastructure/models/author_model.dart';
import 'package:habit_master/features/routine/infrastructure/models/routine_model.dart';

class RoutineRepository implements RoutineInterface {
  RoutineRepository({required this.routineQueries});
  final RoutinesMutations routinesMutations = RoutinesMutations();
  final RoutineQueries routineQueries;

  @override
  Future<Either<Failure, bool>> createRoutine(
      Author author, int successRate, String type) async {
    return await routinesMutations.createRoutine(author, successRate, type);
  }

  @override
  Future<List<Routine>> getRoutines(String routineType) {
    return RoutineQueries().getRoutinesData(routineType);
  }

  @override
  Future<Routine> getOneRoutine(String authorID) async {
    final rawRoutineData = await routineQueries.getRoutineByID(authorID);

    final Routine routine = Routine.fromJson(rawRoutineData[0]);
    return routine;
  }
}

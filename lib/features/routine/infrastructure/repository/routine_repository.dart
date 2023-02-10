import 'package:habit_master/features/routine/domain/interfaces/routine_interface.dart';
import 'package:habit_master/features/routine/infrastructure/data_sources/local_data_source/mutation/routine.dart';
import 'package:habit_master/features/routine/infrastructure/data_sources/local_data_source/queries/routine_queries.dart';
import 'package:habit_master/features/routine/infrastructure/models/author_model.dart';
import 'package:habit_master/features/routine/infrastructure/models/routine_model.dart';

class RoutineRepository implements RoutineInterface {
  final RoutinesMutations routinesMutations = RoutinesMutations();
  final RoutineQueries routineQueries = RoutineQueries();

  @override
  Future<Routine> createRoutine(Author author, int successRate) async {
    return await routinesMutations.createRoutine(author, successRate);
  }

  @override
  Stream<List<Routine>> getRoutines() {
    return RoutineQueries().stream;
  }

  @override
  Future<Routine> getOneRoutine(String authorID) async {
    return await RoutineQueries.getOneRoutine(authorID);
  }
}

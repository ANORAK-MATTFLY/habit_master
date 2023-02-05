import 'package:habit_master/features/routine/domain/interfaces/routine_interface.dart';
import 'package:habit_master/features/routine/infrastructure/data_sources/local_data_source/mutation/routine.dart';
import 'package:habit_master/features/routine/infrastructure/data_sources/local_data_source/queries/routine_queries.dart';
import 'package:habit_master/features/routine/infrastructure/models/author_model.dart';
import 'package:habit_master/features/routine/infrastructure/models/routine_model.dart';

class RoutineRepository implements RoutineInterface {
  RoutineRepository({
    required this.routinesMutations,
    required this.routineQueries,
  });
  final RoutinesMutations routinesMutations;
  final RoutineQueries routineQueries;

  @override
  Future<bool> createRoutine(Author author, int successRate) {
    return routinesMutations.createRoutine(author, successRate);
  }

  @override
  Stream<List<Routine>> getRoutines() {
    return RoutineQueries().stream;
  }
}

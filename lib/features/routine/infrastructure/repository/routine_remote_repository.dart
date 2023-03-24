import 'package:habit_master/features/routine/infrastructure/data_sources/remote_data_source/mutations/routine_remote_mutation.dart';
import 'package:habit_master/features/routine/infrastructure/data_sources/remote_data_source/queries/remote_routine_queries.dart';
import 'package:habit_master/features/routine/infrastructure/models/routine_model.dart';

class RoutineRemoteRepository {
  RoutineRemoteRepository({
    required this.routineRemoteMutations,
    required this.remoteRoutineQueries,
  });
  final RoutineRemoteMutations routineRemoteMutations;
  final RemoteRoutineQueries remoteRoutineQueries;

  Future<List<Routine>> getRemoteRoutines() async {
    final rawRoutinesData = await RemoteRoutineQueries().getRoutines();
    final List<Routine> routines = [];
    for (var index = 0; index < rawRoutinesData.docs.length; index++) {
      final rawRoutineData = rawRoutinesData.docs[index];
      final Routine routine = Routine.fromDocument(rawRoutineData);
      routines.add(routine);
    }
    return routines;
  }
}

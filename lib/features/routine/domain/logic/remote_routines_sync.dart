import 'package:habit_master/core/db/db_constants.dart';
import 'package:habit_master/core/db/local_db.dart';
import 'package:habit_master/core/db/remote_db.dart';
import 'package:habit_master/features/routine/domain/logic/generate_routins.dart';
import 'package:habit_master/features/routine/infrastructure/repository/habit_remote_repository.dart';

import '../../../../dep_injection.dart';

class RemoteRoutinesSynchronization {
  Future<bool> syncRemoteRoutines() async {
    final remoteRoutinesCollection =
        RemoteDatabase.routinesFromCommunityCollection;
    final database = await LocalDatabase.instance.database;
    final rawRemoteRoutinesDocs = await remoteRoutinesCollection.get();

    final routines =
        RoutinesHelpers.generateRoutines(rawRemoteRoutinesDocs.docs);

    for (var index = 0; index < routines.length; index++) {
      final routine = routines[index];

      final localRoutine = await database.rawQuery(
          "SELECT * FROM routine WHERE author_id = '${routine.authorID}'");

      final routineDoesNotExist = localRoutine.isEmpty;

      if (routineDoesNotExist == true) {
        final command = LocalDatabaseConstantProvider.createRoutine(routine);
        await database.rawInsert(command);
        final habitRemoteRepository =
            await serviceLocator<HabitRemoteRepository>();
        await habitRemoteRepository.insertDailyHabit(routine.authorID!);
      }
    }
    return true;
  }
}

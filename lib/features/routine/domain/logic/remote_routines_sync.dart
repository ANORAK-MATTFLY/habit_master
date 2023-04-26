import 'package:habit_master/core/db/db_constants.dart';
import 'package:habit_master/core/db/local_db.dart';
import 'package:habit_master/core/db/remote_db.dart';
import 'package:habit_master/features/routine/domain/logic/generate_routins.dart';

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

      final routineAlreadyExist = localRoutine.isEmpty;

      if (routineAlreadyExist == true) {
        final command = LocalDatabaseConstantProvider.createRoutine(routine);
        await database.rawInsert(command);
      }
    }
    return true;
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:habit_master/features/routine/infrastructure/models/routine_model.dart';

class RoutinesHelpers {
  static List<Routine> generateRoutines(
      List<QueryDocumentSnapshot<Object?>> remoteRoutines) {
    final List<Routine> routines = [];
    for (var index = 0; index < remoteRoutines.length; index++) {
      final rawRoutine = remoteRoutines[index];
      final Routine routine = Routine.fromDocument(rawRoutine);
      routines.add(routine);
    }
    return routines;
  }
}

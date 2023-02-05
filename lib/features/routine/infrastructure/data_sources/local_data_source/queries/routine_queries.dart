import 'dart:async';

import 'package:habit_master/core/db/local_db.dart';
import 'package:habit_master/features/routine/infrastructure/models/routine_model.dart';

class RoutineQueries {
  RoutineQueries() {
    getRoutines().then((rawRoutinesData) {
      final List<Routine> routines = [];
      for (var index = 0; index < rawRoutinesData.length; index++) {
        final rawTask = rawRoutinesData[index];
        final task = Routine.fromJson(rawTask);
        routines.add(task);
        _streamController.sink.add(routines);
      }
    });
  }

  final _streamController = StreamController<List<Routine>>();
  Stream<List<Routine>> get stream => _streamController.stream;

  Future<List<Map<String, Object?>>> getRoutines() async {
    final rawRoutinesData = await LocalDatabase.instance.database.then(
      (value) => value.query("routine"),
    );
    return rawRoutinesData;
  }
}

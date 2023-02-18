import 'dart:async';

import 'package:habit_master/core/db/local_db.dart';
import 'package:habit_master/features/routine/domain/interfaces/routine_queries_interface.dart';
import 'package:habit_master/features/routine/infrastructure/models/routine_model.dart';

class RoutineQueries implements RoutineQueriesInterface {
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
  @override
  Future<List<Map<String, Object?>>> getRoutines() async {
    final rawRoutinesData = await LocalDatabase.instance.database.then(
      (value) => value.query("routine"),
    );
    return rawRoutinesData;
  }

  @override
  Future<List<Map<String, Object?>>> getOneRoutine(String authorID) async {
    final database = await LocalDatabase.instance.database;
    final rawData = await database.rawQuery(
        "SELECT * FROM routine WHERE author_id = '$authorID' LIMIT 1");

    return rawData;
  }
}

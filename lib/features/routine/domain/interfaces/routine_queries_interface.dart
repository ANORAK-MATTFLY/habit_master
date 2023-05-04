import 'package:habit_master/features/routine/infrastructure/models/routine_model.dart';

abstract class RoutineQueriesInterface {
  Future<List<Map<String, Object?>>> getRoutines();
  Future<List<Map<String, Object?>>> getRoutineByID(String authorID);
  Future<List<Routine>> getRoutinesData(String routineType);
}

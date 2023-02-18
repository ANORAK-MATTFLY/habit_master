abstract class RoutineQueriesInterface {
  Future<List<Map<String, Object?>>> getRoutines();
  Future<List<Map<String, Object?>>> getOneRoutine(String authorID);
}

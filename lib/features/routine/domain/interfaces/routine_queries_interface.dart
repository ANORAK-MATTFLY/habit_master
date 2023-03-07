abstract class RoutineQueriesInterface {
  Future<List<Map<String, Object?>>> getRoutines();
  Future<List<Map<String, Object?>>> getRoutineByID(String authorID);
}

abstract class HabitHistoryQueriesInterface {
  Future<List<Map<String, Object?>>> getHabitHistoryRecord(
      String habitHistoryID);
  Future<List<Map<String, Object?>>> getTodaysHabitHistoryRecord(
      String habitID, String doneOn);
}

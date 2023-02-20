abstract class HabitQueriesInterface {
  Future<List<Map<String, Object?>>> getHabitsData(String routineID);
  Future<List<Map<String, Object?>>> countNumberOfDoneHabits(
      String routineID, String doneOn);
  Future<List<Map<String, Object?>>> getHabitById(String habitID);
}

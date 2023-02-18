import 'package:habit_master/core/db/db_constants.dart';
import 'package:habit_master/core/db/local_db.dart';

class HabitHistoryQueries {
  Future<List<Map<String, Object?>>> getHabitHistoryRecord(
      String habitHistoryID) async {
    try {
      final database = await LocalDatabase.instance.database;
      final query =
          LocalDatabaseConstantProvider.getHabitHistory(habitHistoryID);
      final rawHabitHistoryData = await database.rawQuery(query);
      return rawHabitHistoryData;
    } catch (error) {
      rethrow;
    }
  }

  Future<List<Map<String, Object?>>> getTodaysHabitHistoryRecord(
      String habitID, String doneOn) async {
    try {
      final database = await LocalDatabase.instance.database;
      final query =
          LocalDatabaseConstantProvider.getTodaysHabitHistory(habitID, doneOn);
      final rawHabitHistoryData = await database.rawQuery(query);
      return rawHabitHistoryData;
    } catch (error) {
      rethrow;
    }
  }
}

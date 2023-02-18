import 'package:habit_master/core/db/db_constants.dart';
import 'package:habit_master/core/db/local_db.dart';
import 'package:habit_master/features/routine/infrastructure/models/habit_history.dart';

class HabitHistoryMutations {
  Future<bool> deleteHabitHistoryRecord(String habitID) async {
    try {
      final database = await LocalDatabase.instance.database;
      final query = LocalDatabaseConstantProvider.deleteHabitHistory(habitID);
      await database.rawDelete(query);
      return true;
    } catch (error) {
      rethrow;
    }
  }

  Future<bool> createHabitHistoryRecord(HabitHistory habitHistory) async {
    try {
      final database = await LocalDatabase.instance.database;
      final query =
          LocalDatabaseConstantProvider.createHabitHistory(habitHistory);
      await database.rawInsert(query);
      return true;
    } catch (error) {
      rethrow;
    }
  }
}

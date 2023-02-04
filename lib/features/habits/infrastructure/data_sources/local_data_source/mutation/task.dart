import 'package:habit_master/features/habits/infrastructure/data_sources/local_data_source/db_constants.dart';
import 'package:habit_master/features/habits/infrastructure/models/task_model.dart';
import 'package:sqflite/sqflite.dart';

class TaskMutation {
  Future<void> createTask(Task task, Database database) async {
    try {
      final createTaskQuery = LocalDatabaseConstantProvider.createTask(task);
      await database.rawInsert(createTaskQuery);
    } catch (error) {
      rethrow;
    }
  }

  static Future<void> toggleTask(
      Task task, bool isDone, Database database) async {
    try {
      await database.rawQuery(
          "UPDATE task SET is_done = $isDone WHERE id = '${task.id}'");
    } catch (error) {
      rethrow;
    }
  }

  static Future<void> updateTaskExpirationDate(
      String taskID, String expirationDate, Database database) async {
    try {
      await database.rawQuery(
          "UPDATE task SET expiration_date = '$expirationDate' WHERE id = '$taskID'");
    } catch (error) {
      rethrow;
    }
  }
}

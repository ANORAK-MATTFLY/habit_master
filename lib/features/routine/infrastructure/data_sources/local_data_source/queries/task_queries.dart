import 'dart:async';

import 'package:habit_master/features/routine/infrastructure/data_sources/local_data_source/author_db.dart';
import 'package:habit_master/features/routine/infrastructure/models/task_model.dart';
import 'package:sqflite/sqflite.dart';

class TaskQueries {
  TaskQueries(String habitID) {
    getTasksData(habitID).then((rawTasksData) {
      final List<Task> tasks = [];
      for (var index = 0; index < rawTasksData.length; index++) {
        final rawTask = rawTasksData[index];
        final task = Task.fromJson(rawTask);
        tasks.add(task);
        _streamController.sink.add(tasks);
      }
    });
  }

  final _streamController = StreamController<List<Task>>();
  Stream<List<Task>> get stream => _streamController.stream;

  Future<List<Map<String, Object?>>> getTasksData(String habitID) async {
    final data = await AuthorDatabase.instance.database.then(
      (value) =>
          value.rawQuery("SELECT * FROM task WHERE habit_id = '$habitID'"),
    );
    return data;
  }

  Future<void> updateTaskExpirationDate(Task task) async {
    final diff = DateTime.now().compareTo(DateTime.parse(task.expirationDate!));
    if ((diff == 1) || (diff == 0)) {
      final newDate = DateTime.now().add(const Duration(days: 1)).toString();
      await AuthorDatabase.updateTaskExpirationDate(task.id!, newDate);
      if (task.isDone! == true) {
        await AuthorDatabase.toggleTask(task, false);
      }
    } else {
      return;
    }
  }

  Future<List<Task>> getTasks(String habitID, Database database) async {
    try {
      final rawTasks = await database
          .rawQuery("SELECT * FROM task WHERE habit_id = '$habitID'");
      final List<Task> tasks = [];
      for (var index = 0; index < rawTasks.length; index++) {
        final rawTask = rawTasks[index];
        final task = Task.fromJson(rawTask);
        await updateTaskExpirationDate(task);
        tasks.add(task);
      }
      return tasks;
    } catch (error) {
      rethrow;
    }
  }

  static Future<List<Task>> getTaskState(
      String taskID, Database database) async {
    try {
      final rawTasks = await database
          .rawQuery("SELECT task.is_done FROM task WHERE id = '$taskID'");
      final List<Task> tasks = [];
      for (var index = 0; index < rawTasks.length; index++) {
        final rawTask = rawTasks[index];
        final task = Task.fromJson(rawTask);
        tasks.add(task);
      }
      return tasks;
    } catch (error) {
      rethrow;
    }
  }
}

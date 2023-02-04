import 'dart:async';

import 'package:habit_master/features/habits/infrastructure/data_sources/local_data_source/mutation/task.dart';
import 'package:habit_master/features/habits/infrastructure/data_sources/local_data_source/queries/habit_queries.dart';
import 'package:habit_master/features/habits/infrastructure/data_sources/local_data_source/queries/task_queries.dart';
import 'package:habit_master/features/habits/infrastructure/models/habit_model.dart';
import 'package:habit_master/features/habits/infrastructure/models/task_model.dart';
import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

import '../../models/author_model.dart';
import 'db_constants.dart';
import 'habits_db.dart';

class AuthorDatabase {
  static final AuthorDatabase instance = AuthorDatabase._init();
  static Database? _localDatabase;
  AuthorDatabase._init();

  Future<Database> get database async {
    if (_localDatabase != null) return _localDatabase!;
    _localDatabase = await _initDB("habits_local_database47.db");
    return _localDatabase!;
  }

  Future<Database> _initDB(String databaseFilePath) async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, databaseFilePath);
    return await openDatabase(path, version: 1, onCreate: _createAuthorTable);
  }

  Future _createAuthorTable(Database database, int version) async {
    const createAuthorTable = LocalDatabaseConstantProvider.createAuthorTable;
    await HabitsDatabaseProvider.createDatabaseTable(database, version);
    const createTaskTable = LocalDatabaseConstantProvider.createTaskTable;
    await database.execute(createAuthorTable);
    await database.execute(createTaskTable);
  }

  Future<bool> closeDatabase() async {
    final database = await instance.database;
    database.close();
    return database.isOpen;
  }

  static createAuthor(List<Author> authors) async {
    final database = await instance.database;
    try {
      for (int index = 0; index < authors.length; index++) {
        final Author author = authors[index];
        await HabitsDatabaseProvider.createHabit(author, 0);
        final insertAuthor = LocalDatabaseConstantProvider.createAuthor(author);
        await database.rawInsert(insertAuthor);
      }
    } catch (error) {
      rethrow;
    }
  }

  static Future createTasks(List<Task> tasks) async {
    final database = await instance.database;
    try {
      for (int index = 0; index < tasks.length; index++) {
        final Task task = tasks[index];
        final insertAuthor = LocalDatabaseConstantProvider.createTask(task);
        await database.rawInsert(insertAuthor);
      }
    } catch (error) {
      rethrow;
    }
  }

  static Future createTask(Task task) async {
    final database = await instance.database;
    try {
      await TaskMutation().createTask(task, database);
    } catch (error) {
      rethrow;
    }
  }

  static Stream<List<Author>> getAuthors() async* {
    final database = await instance.database;
    final maps = await database.query("author");
    final List<Author> authors = [];

    for (var index = 0; index < maps.length; index++) {
      final author = maps[index];
      final serializedAuthor = Author.fromJson(author);
      authors.add(serializedAuthor);
    }
    yield authors;
  }

  static Stream<List<Habit>> getHabits() async* {
    final database = await instance.database;
    final habit = await HabitQueries().getHabitById(database);
    yield habit;
  }

  static Future<List<Task>> getTasks(String habitID) async {
    final database = await instance.database;

    final tasks = await TaskQueries("").getTasks(habitID, database);
    return tasks;
  }

  static Future<List<Task>> getTaskState(String taskID) async {
    final database = await instance.database;

    final tasks = await TaskQueries.getTaskState(taskID, database);
    return tasks;
  }

  static Future<void> toggleTask(Task task, bool isDone) async {
    final database = await instance.database;

    await TaskMutation.toggleTask(task, isDone, database);
  }

  static Future<void> updateTaskExpirationDate(
      String taskID, String expirationDate) async {
    final database = await instance.database;

    await TaskMutation.updateTaskExpirationDate(
        taskID, expirationDate, database);
  }

  Future<bool> checkIfAuthorsExist() async {
    final database = await instance.database;
    final maps = await database.query("author");
    return maps.isNotEmpty;
  }
}

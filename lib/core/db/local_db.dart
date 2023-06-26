import 'dart:async';

import 'package:habit_master/core/db/db_constants.dart';

import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

class LocalDatabase {
  static final LocalDatabase instance = LocalDatabase._init();
  static Database? _localDatabase;
  LocalDatabase._init();

  Future<Database> get database async {
    if (_localDatabase != null) return _localDatabase!;
    _localDatabase = await _initDB("habits_local_database1050.db");
    return _localDatabase!;
  }

  Future<Database> _initDB(String databaseFilePath) async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, databaseFilePath);
    return await openDatabase(path, version: 1, onCreate: _createTables);
  }

  Future _createTables(Database database, int version) async {
    const createAuthorTable = LocalDatabaseConstantProvider.createAuthorTable;
    const createRoutineTable = LocalDatabaseConstantProvider.createRoutineTable;
    const createHabitTable = LocalDatabaseConstantProvider.createHabitTable;
    const createPermissionTable =
        LocalDatabaseConstantProvider.createPermissionTable;
    const createHabitHistoryTable =
        LocalDatabaseConstantProvider.createHabitHistoryTable;
    const createScoreTable = LocalDatabaseConstantProvider.createScoreTable;
    await database.execute(createAuthorTable);
    await database.execute(createRoutineTable);
    await database.execute(createHabitTable);
    await database.execute(createHabitHistoryTable);
    await database.execute(createPermissionTable);
    await database.execute(createScoreTable);
  }

  Future<bool> closeDatabase() async {
    final database = await instance.database;
    database.close();
    return database.isOpen;
  }
}

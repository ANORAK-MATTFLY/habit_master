import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

import '../../../models/author_model.dart';
import 'db_constants.dart';
import 'habits_db.dart';

class AuthorDatabase {
  static final AuthorDatabase instance = AuthorDatabase._init();
  static Database? _localDatabase;
  AuthorDatabase._init();

  Future<Database> get database async {
    if (_localDatabase != null) return _localDatabase!;
    _localDatabase = await _initDB("habits_local_database4.db");
    return _localDatabase!;
  }

  Future<Database> _initDB(String databaseFilePath) async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, databaseFilePath);
    return await openDatabase(path, version: 1, onCreate: _createAuthorTable);
  }

  Future _createAuthorTable(Database database, int version) async {
    const createAuthorTable = LocalDatabaseConstantProvider.createAuthorTable;
    await HabitsDatabaseProvider.createDatabase(database, version);
    await database.execute(createAuthorTable);
  }

  Future<bool> closeDatabase() async {
    final database = await instance.database;
    database.close();
    return database.isOpen;
  }

  Future createAuthor() async {
    final database = await instance.database;
    for (int index = 0; index < predefinedAuthors.length; index++) {
      final Author author = predefinedAuthors[index];

      final authorInsertionIntoTable =
          LocalDatabaseConstantProvider.createAuthor(author);
      await database.rawInsert(authorInsertionIntoTable);
    }
  }

  Future getAuthors() async {
    final database = await instance.database;
    final maps = await database.query("author");
    if (maps.isNotEmpty) {
      return List.generate(maps.length, (i) {
        final author = maps[i];
        final serializedAuthor = Author.fromJson(author);
        return serializedAuthor;
      });
    } else {
      return false;
    }
  }

  Future checkIfAuthorsExist() async {
    final database = await instance.database;
    final maps = await database.query("author");
    if (maps.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}

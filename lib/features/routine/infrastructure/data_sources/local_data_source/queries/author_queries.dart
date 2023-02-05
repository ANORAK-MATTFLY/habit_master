import 'package:habit_master/core/db/local_db.dart';

class AuthorQueries {
  Future<bool> checkIfAuthorsExist() async {
    final database = await LocalDatabase.instance.database;
    final maps = await database.query("author");
    return maps.isNotEmpty;
  }
}
